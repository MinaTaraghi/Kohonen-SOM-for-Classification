function neighbors=RadiusNeighborhood(center,MaxX,MaxY,radius)

neighbors=[];

c=0;
for j=center(2)-radius:center(2)
	for i=center(1)-c:center(1)+c
		if i>0 && i<=MaxX && j>0 && j<=MaxY
                neighbors=[neighbors; i j];
        end
	end
	c=c+1;
end
c=c-2;
for j=center(2)+1:center(2)+radius
	for i=center(1)-c:center(1)+c
		if i>0 && i<=MaxX && j>0 && j<=MaxY
            neighbors=[neighbors; i j];
        end
	end
	c=c-1;
end



end