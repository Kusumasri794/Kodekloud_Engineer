Task-30.sh Linux GPG Encryption

# Exercise: We have confidential data that needs to be transferred to a remote location, so we need to encrypt that data.We also need to decrypt data we received from a remote location in order to understand its content. On storage server in Stratos Datacenter we have private and public keys stored /home/*_key.asc. Use those keys to perform the following actions.
# Encrypt /home/encrypt_me.txt to /home/encrypted_me.asc.
# Decrypt /home/decrypt_me.asc to /home/decrypted_me.txt. (Passphrase for decryption and encryption is kodekloud).

#Solution: 

#login to Storage server using credentials
natasha@ststor01
passowrd:

# switch to sudo user and /home directory
sudo su -
/home
ll

# import private and public keys using public_key.asc , private_key.asc
gpg --import  public_key.asc
gpg --import private_key.asc
ll

# encrypt encrypt_me.txt to encrypted_me.asc
gpg --encrypt -r kodekloud@kodekloud.com --armor < encrypt_me.txt -o encrypted_me.asc

# press y password Phrase: kodekloud

#decrypt decrypt_me.asc to decrypted_me.txt
gpg --decrypt decrypt_me.asc > decrypted_me.txt
ll


#verify all decrypt and encrypt files using cat command
cat encrypt_me.txt
cat decrypt_me.asc
cat encrypted_me.asc
cat decrypted_me.txt

exit 0

logout






