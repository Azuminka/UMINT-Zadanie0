clear; clc; close all;
startVector=[-5,-1,1,5];
step=0.5;
lastBestY= realmax;
lastBestX=realmax;

syms d;
ezplot(funkcia1D(d),[-6,6])
hold on

for x = 1:length(startVector)
    gen=startVector(x);
    plot(gen, funkcia1D(gen),'gx','MarkerSize',7,'LineWidth',2)
    while true
        xs1=gen-step;
        xs2=gen+step;
        ys1=funkcia1D(xs1);
        ys2=funkcia1D(xs2);
        yp=funkcia1D(gen);
        [lowerY,indexY]=min([ys1,ys2,yp]);
        arrX=[xs1,xs2,gen];
        gen=arrX(indexY);
        if lowerY==yp
            if lastBestY > lowerY
                lastBestY=lowerY;
                lastBestX=gen;
            end
            break;
        end
        plot(gen,lowerY,'gx','MarkerSize',7,'LineWidth',2)
    end
end
plot(lastBestX,lastBestY,'rO','MarkerSize',15,'LineWidth',2)

