import os
import sys

p = sys.argv[1]
path = os.path.join("/home/", "%s", "git") % p
print(path)