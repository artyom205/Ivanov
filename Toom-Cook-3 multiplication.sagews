︠39a8555d-5097-4377-84d2-64d9a722538ds︠
def Split(xx,n):
    x=[]
    x.append(int(xx[len(xx)-n:len(xx)]))
    x.append(int(xx[len(xx)-2*n:len(xx)-n])) 
    x.append(int(xx[0:len(xx)-2*n]))
    return x

def Toom_3(xx,yy):
    #Splitting
    B=max(len(xx)/3,len(yy)/3).ceil()
    x=Split(xx,B)
    y=Split(yy,B)
    B=pow(10,B)

    #Evaluation
    r=[
        x[0]-2*x[1]+4*x[2],
        x[0]-x[1]+x[2],
        x[0],
        x[0]+x[1]+x[2],
        x[0]+2*x[1]+4*x[2]
      ]
    s=[
        y[0]-2*y[1]+4*y[2],
        y[0]-y[1]+y[2],
        y[0],
        y[0]+y[1]+y[2],
        y[0]+2*y[1]+4*y[2]
      ]

    #Pointwise multiplication
    t=[]
    for i in range(5):
        t.append(r[i]*s[i])

    z=[
        t[2],
        t[0]/12-2*t[1]/3+2*t[3]/3-t[4]/12,
        -t[0]/24+2*t[1]/3-5*t[2]/4+2*t[3]/3-t[4]/24,
        -t[0]/12+t[1]/6-t[3]/6+t[4]/12,
        t[0]/24-t[1]/6+t[2]/4-t[3]/6+t[4]/24
      ]

    #Reconstruction
    zz=0;
    for i in range(5):
        zz = zz+z[i]*pow(B,i)
    return zz
︡71e1852f-ec23-4c46-a518-dc9b9ed161d2︡{"done":true}
︠8527f216-bd28-48d8-ad56-038921c0da77s︠
xx=str(123^421897)
yy=str(987^436112)
%time mult1_1=Toom_3(xx,yy)

xx=str(12345^421897)
yy=str(98765^436112)
%time mult1_2=Toom_3(xx,yy)

xx=str(1234567^421897)
yy=str(9876543^436112)
%time mult1_3=Toom_3(xx,yy)

xx=str(123456789^421897)
yy=str(987654321^436112)
%time mult1_4=Toom_3(xx,yy)

xx=str(1234567891011^421897)
yy=str(9876543210123^436112)
%time mult1_5=Toom_3(xx,yy)

︡a45cbba5-0f83-44c1-9752-459e9d9cce4e︡{"stdout":"\nCPU time: 8.67 s, Wall time: 9.19 s"}︡{"stdout":"\n"}︡{"stderr":"Error in lines 1-1\n"}︡{"stderr":"Traceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1234, in execute\n    flags=compile_flags), namespace, locals)\n  File \"\", line 1, in <module>\n  File \"\", line 3, in Toom_3\n  File \"\", line 4, in Split\n  File \"src/cysignals/signals.pyx\", line 320, in cysignals.signals.python_check_interrupt\nKeyboardInterrupt\n"}︡{"stdout":"\nCPU time: 10.09 s, Wall time: 10.58 s"}︡{"stdout":"\n"}︡{"stderr":"Error in lines 1-1\n"}︡{"stderr":"Traceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1234, in execute\n    flags=compile_flags), namespace, locals)\n  File \"\", line 1, in <module>\n  File \"\", line 4, in Toom_3\n  File \"\", line 3, in Split\n  File \"src/cysignals/signals.pyx\", line 320, in cysignals.signals.python_check_interrupt\nKeyboardInterrupt\n"}︡{"stdout":"\nCPU time: 32.60 s, Wall time: 34.72 s"}︡{"stdout":"\n"}︡{"stdout":"\nCPU time: 87.49 s, Wall time: 92.78 s"}︡{"stdout":"\n"}︡{"stdout":"\nCPU time: 180.94 s, Wall time: 188.22 s"}︡{"stdout":"\n"}︡{"done":true}︡
︠690a587d-27c8-448a-96d8-7b3170ce17d6s︠
xx=123^421897
yy=987^436112
%time mult2_1=xx*yy

xx=12345^421897
yy=98765^436112
%time mult2_2=xx*yy

xx=1234567^421897
yy=9876543^436112
%time mult2_3=xx*yy

xx=123456789^421897
yy=987654321^436112
%time mult2_4=xx*yy

xx=1234567891011^421897
yy=9876543210123^436112
%time mult2_5=xx*yy
︡ded12a4a-4771-4af4-811e-44556e5e5b58︡
︠ce58b773-6cf7-4d17-ac7f-77d52ee5511cs︠
print(mult1_1 == mult2_1)
print(mult1_2 == mult2_2)
print(mult1_3 == mult2_3)
print(mult1_4 == mult2_4)
print(mult1_5 == mult2_5)
︡da62234d-cad3-43af-89c5-797b2b24cb9a︡{"stdout":"True\n"}︡{"stdout":"True\n"}︡{"stdout":"True\n"}︡{"stdout":"True\n"}︡{"stdout":"True\n"}︡{"done":true}︡









