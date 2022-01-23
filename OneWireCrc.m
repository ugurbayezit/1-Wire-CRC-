clc;clear all;close all;

%hexStr = ["3D" "7B" "66" "99" "00" "00" "00"];
hexStr = ["3D" "FC" "AD" "99" "00" "00" "00"];

D = hexToBinaryVector(hexStr);
inp_arr=zeros(1,56);
init_arr=[0 0 0 0 0 0 0 0];
z=1;

for x=1:7
    for y=8:-1:1
    %for y=1:8
        inp_arr(z)=D(x,y);
        z=z+1;
    end 
end

for i=1:56
    
variable=xor(init_arr(8),inp_arr(1,i));

variable_5=xor(init_arr(4),variable);
variable_6=xor(init_arr(5),variable);


init_arr(1,2:4)=init_arr(1,1:3);
init_arr(1,7:8)=init_arr(1,6:7);

init_arr(1,5)=variable_5;
init_arr(1,6)=variable_6;
init_arr(1,1)=variable;

end
binaryVectorToHex(init_arr)


