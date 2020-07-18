import tkinter as tk
import os
from PIL import ImageTk, Image
import webbrowser as wb

print("this is a bug, you shouldn't be able to see this jk, I put it here so it's neat")



class Application(tk.Frame):
    def __init__(self, master=None):
        super().__init__(master)
        self.master = master
        self.pack()
        self.create_widgets()
        self.master.title("UH-OH STTINKY")   #le title of le window
        self.master.minsize(720, 360)        #le size of le window
        self.master.maxsize(720, 360)


    def create_widgets(self):

        self.text = tk.Label(self, text="Peenus", fg="red", font=("Helvetica", 16)) #header text lol
        self.text.grid(columnspan=2)
                
                #FIRST BUTTON
                
        self.hi_there = tk.Button(self)
        self.hi_there["text"] = "Hello World\n(click me)"
        self.hi_there["command"] = self.say_hi
        self.hi_there.grid(row =1, column= 0, sticky='wens', padx=5, pady=5)

                #FIRST BUTTON 2nd row
                
        self.hi_there2 = tk.Button(self)
        self.hi_there2["text"] = "Hello World\n(click me)"
        self.hi_there2["command"] = self.say_hi
        self.hi_there2.grid(row =2, column= 0, sticky='wens', padx=5, pady=5)

                #SECOND BUTTON (TO HASH CALC PY CALLBACK!!!)

        self.hash_calc = tk.Button(self)
        self.hash_calc["text"] = "HASH CALCULATOR\n(SHA256,128,64 ; MD5)"
        self.hash_calc["command"] = self.hash_calc
        self.hash_calc.grid(row =1, column= 1, sticky='wens', padx=5, pady=5)


                #QUIT BUTTON 

        self.quit = tk.Button(self, text="QUIT", fg="red",command=self.master.destroy)
        self.quit.grid(row= 2, columnspan=2, sticky='wens', padx=5, pady=5)

                #BOTTOM IMAGE !

        ico = Image.open(os.getcwd()+"/icon.gif")
        icon = ImageTk.PhotoImage(ico)
        self.bottom_image = tk.Label(self, image=icon)
        self.bottom_image.image = icon
        self.bottom_image.grid(row =3, columnspan=2, sticky='wens')

                #urlman

        self.hash_calc = tk.Button(self)
        self.hash_calc["text"] = "Goto my website."
        self.hash_calc["command"] = wb.open('http://alienozi.c1.biz', new=2)
        self.hash_calc.grid(row =4, columnspan=2, sticky='wens', padx=5, pady=5)


    def say_hi(self):
        print("hi there, everyone!")

    def hash_calc(self):
        print("code goes here")

root = tk.Tk()
app = Application(master=root)
app.mainloop()
