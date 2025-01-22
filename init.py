import os

computer_dirs = []

path = input("enter cc-mek-scada git path: ")

if os.path.isdir(path):
    dirs = os.listdir("./")

    if len(computer_dirs) > 0:
        dirs = computer_dirs

    # for each computer root directory
    for root in dirs:
        if os.path.isdir(root) and root.isdigit():
            f = open(root + "/_path.txt", "w")
            f.write(path)
            f.close()
else:
    print("path does not exist!")
