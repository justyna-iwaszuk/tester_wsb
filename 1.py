import os
import time

print(os.getcwd())
os.chdir('C:\\Users\\admin\\Desktop')
os.mkdir('nowy2')
time.sleep(10)
os.rmdir('nowy2')

