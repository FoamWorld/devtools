using ColorTypes
using FileIO
function make_shape(from::String,to::String)
io=open(to,"w")
img=load(from)
#= sz=size(img)
w=sz[1]
h=sz[2] =#
num=0x0
count=0x0
for i in 1:32
	for j in 1:32
		re=red(img[i,j]).i
		if re==0xff # white => 0
		elseif re==0x0 # black => 3
			num+=(0x3)<<(count<<1)
		elseif re>0xc0 # light-grey => 1
			num+=(0x1)<<(count<<1)
		else # dark-grey => 2
			num+=(0x2)<<(count<<1)
		end
		count+=0x1
		if count==0x4
			write(io,num)
			count=0x0
			num=0x0
		end
	end
end
close(io)
end
