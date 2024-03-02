import os
#import time

print(os.getcwd())
with open('C:\\Users\\admin\\tester-wsb\\my_file.txt', 'r') as plik1:
    content = plik1.read()
    print(content)
    print(content.split())
for i in content:
    print(i)