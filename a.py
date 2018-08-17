#!/usr/bin/python
#coding=utf-8
print "你好，世界"
if True:
    print "true"
else:
    print "false"
#a=raw_input("按下enter见退出，其他任意键显示\n")

#print a
a=b=c=1
print a,b,c
x="1234567"
print x[1:3]
i=20
while i>10:
    i=i-1
    print i
for i in range(10):
    if i==5:
        print "jump out"
        pass
    print i
import math
print dir (math)
print math.__doc__,math.e

def cy(y):
    y=y+1
    print y-1,y
    cy(y)
    return
print cy
