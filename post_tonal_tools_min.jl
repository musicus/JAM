function opi(pcc=[0,2,6,8])
	return [pcc[i+1] - pcc[i] for i ∈ eachindex(pcc) if i < length(pcc)]
end

function ais(pcc=[0,2,6,8])
	return opi(pcc)
end

function upi(pcc=[0,2,6,8])
	return [abs(pcc[i+1] - pcc[i]) for i ∈ eachindex(pcc) if i < length(pcc)]
end

function opci(pcc=[0,2,6,8])
	return [i < 0 ? i+12 : i for i ∈ [(pcc[i+1] - pcc[i]) % 12 for i ∈ eachindex(pcc) if i < length(pcc)]]
end

function upci(pcc=[0,2,6,8])
	x = [i < 0 ? i+12 : i for i ∈ [(pcc[i+1] - pcc[i]) % 12 for i ∈ eachindex(pcc) if i < length(pcc)]]
	y = [i < 0 ? i+12 : i for i ∈ [(pcc[i] - pcc[i+1]) % 12 for i ∈ eachindex(pcc) if i < length(pcc)]]
	ic = [i[1] < i[2] ? i[1] : i[2] for i ∈ zip(x,y)]
	return ic
end

function ic(pcc=[0,2,6,8])
	return upci(pcc)
end

function loaded()
	return nothing
end