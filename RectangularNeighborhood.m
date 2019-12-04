function neighbors=RectangularNeighborhood(center,MaxX,MaxY,radius)
neighbors=[];

for i=center(1)-radius:center(1)+radius
	for j=center(2)-radius:center(2)+radius
	if i>0 && i<=MaxX && j>0 && j<=MaxY
            neighbors=[neighbors; i j];
    end
	end
end
end