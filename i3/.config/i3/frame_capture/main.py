import subprocess
import cv2
import numpy
from PIL import Image
from PIL.ExifTags import TAGS
import time

cap = cv2.VideoCapture(0)
cap.set(3,400)

cap.set(4,400)
cap.set(5,4)
cap.set(10, 50)
for a in range(2): 
    r, frame = cap.read()
    # cv2.imwrite("test.jpg", frame)
    time.sleep(.3)

# exposure = cap.get(cv2.CAP_PROP_EXPOSURE)
# print(exposure)

total = 0

for r in frame:
    for c in r:
        total += sum(c) + len(c)
        
avarage = total / (400 * 400) / 5
print(avarage)

command = "brighnessctl set " + str(avarage)

subprocess.run(["brightnessctl", "set", str(avarage)])
# print(frame)
