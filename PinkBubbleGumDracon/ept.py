#!/usr/bin/env python

import os
import Tkinter
hiyou=""
if os.getuid() !=0:
    hiyou="uSeR"
else:
    hiyou="Su"
path01=os.path.expanduser('~/.fluxbox/style1s')
path02="/usr/share/fluxbox/styles/"
if os.path.exists(path01):
    prnt01=hiyou + " good ~/.fluxbox/styles"
elif os.path.exists(path02):
    prnt01=path02

class gusome_tk(Tkinter.Tk):
    def __init__ (self,parent):
        Tkinter.Tk.__init__(self,parent)
        self.parent = parent
        self.initialize()

    def initialize(self):
        self.grid()

        self.entry= Tkinter.Entry(self)
        self.entry.insert(0,prnt01)
        self.entry.grid(column=0,row=4,sticky='EW')


        butt = Tkinter.Button(self,text=hiyou)
        butt.grid(column=4,row=4)

        butt01 = Tkinter.Button(self,text=u"text..")
        butt01.grid(column=5,row=4)




        label = Tkinter.Label(self,anchor="w",fg="#EA17D0",bg="#3E3E3E",text= hiyou  + "\nLabel txt" )
        label.grid(column=0,row=1,columnspan=1,sticky='EW')
        label01= Tkinter.Label(self,anchor="w",text='label01')
        label01.grid(column=0,row=2,columnspan=1,sticky='EW')

if __name__ == "__main__":
    app=gusome_tk(None)
    app.title('Hi there')
    app.mainloop()
