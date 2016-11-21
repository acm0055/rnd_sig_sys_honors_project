prologues := 3;
outputtemplate := "%j-%c.mps";

beginfig(1);
   x:= 20;

   %floor and wall
   draw x*(0,0)--x*(20,0);
   draw x*(20,0)--x*(20,8);

   %speaker and speaker box
   draw x*(.5,0)--x*(2.5,0)--x*(2.5,2)--x*(.5,2)--cycle;
   draw x*(1,2)--x*(2,2)--x*(2,3.5)--x*(1,3.5)--cycle;

   %audio wave speaker
   draw x*(2.1,2.75+.25)..x*(2.2,2.75)..x*(2.1,2.75-.25);
   draw x*(2.4,2.75+.5)..x*(2.6,2.75)..x*(2.4,2.75-.5);

   %mic
   draw x*(7,2.95)..x*(7.2,2.75)..x*(7,2.55)..x*(6.8,2.75)..cycle;
   draw x*(7,2.95)--x*(7.8,2.85)--x*(7.8,2.65)--x*(7,2.55);

   %%wall waves
   draw x*(19.5,4+.5)..x*(19.5-.25,4)..x*(19.5,4-.5);
   draw x*(19,4+1)..x*(19-.5,4)..x*(19,4-1);
   draw x*(18,4+2)..x*(18-1,4)..x*(18,4-2);

   %delta x
endfig;
end;
