using Luxor



width!, height! = 600 , 600
backdrop(scene, framenumber) =  background("black")
field = Movie(width!, height!, "bang")

function estrela(width!,height!)
    x = rand(-width!:width!)
    y = rand(-height!:height!)
    z = rand(0:width!)

    return [x,y,z]
end

numEstrelas = [estrela(width!, height!) for _ in 1:400]

function starfield(scene, framenumber)
        background("black")
        sethue("white")
    for i in numEstrelas
        x,y,z = i
        escala = width!/(width!+z)
        sx = x * escala
        sy = y * escala
        px = x
        py = y
        #ellipse(Point(sx,sy), 5, 5, :fill)
        if z > 0
        line(Point(px , py), Point(sx, sy), :fillstroke)
        end
        i[3] -= 12
        if i[3] < 1
            i[1] = rand(-width!:width!)
            i[2] = rand(-height!:height!)
            i[3] = rand(0:width!)           
        end   
    end
end

#----------------------------------------------------#
    


animate(field, [
    Scene(field, backdrop, 0:359)
    Scene(field, starfield, 0:359)],
    creategif=true,
    pathname="/tmp/animationtest.gif")