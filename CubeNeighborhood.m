function neighbors=CubeNeighborhood(center,MaxX,MaxY,MaxZ,radius)
neighbors=[];

for i=center(1)-radius:center(1)+radius
	for j=center(2)-radius:center(2)+radius
	for k=center(3)-radius:center(3)+radius
		if i>0 && i<=MaxX && j>0 && j<=MaxY && k>0 && k<=MaxZ
                neighbors=[neighbors; i j k];
		end
	end
end
end