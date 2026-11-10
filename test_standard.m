clear all
fid=fopen('test_standard.tex','w') % 
fprintf(fid,'%s','\begin{quiz}{standard equations }')
for i=1:1:25 
    while 1
        a=randi([-10,10],1)
        b=randi([-10,10],1)
        c=randi([-10,10],1)
        d=randi([-10,10],1)
        if a==0 
            a=a+1
        end
        if c==0
            c=c+1
        end
        alpha=a*c
        beta=a*d+b*c
        gamma=b*d
        if a*d+b*c~=0 && a*d-b*c~=0
            break
        end
    end
    syms x
    ecua= alpha*x^2+beta*x+gamma==0
    exp=latex(sym(ecua))
    if -b/a>-d/c
        solmayor=sym(-b/a)
        solmenor=sym(-d/c)
    else
        solmayor=sym(-d/c)
        solmenor=sym(-b/a)
    end
    imagi=latex(sym(-b))
    reali=latex(sym(a))
    fprintf(fid,'%s %i %s ','\begin{cloze}{Question',i,'}')
    fprintf(fid,'%s %s %s','The solution over $\mathbb{R}$ of the following equation$',exp,' $ is ')
    fprintf(fid,'\n')
    fprintf(fid,'%s','\begin{shortanswer}')
    fprintf(fid,'%s %s ','The smallest value of the solution is x= ',solmenor)
    fprintf(fid,'%s','\end{shortanswer}')
    fprintf(fid,'\n')
    fprintf(fid,'%s','\begin{shortanswer}')
    fprintf(fid,'%s %s ',', and  the greatest value of the solution is x= ',solmayor)
    fprintf(fid,'%s','\end{shortanswer}')
    fprintf(fid,'\n')
    fprintf(fid,'%s','Format your answer as a/b (do not use spaces).')
    fprintf(fid,'%s','\end{cloze}')
end
fprintf(fid,'%s','\end{quiz}')
fclose(fid)