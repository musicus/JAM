######################
## Post-Tonal Tools ##
######################

# General
# =======
function midi_to_pc(pcc)
	return [i % 12 for i in pcc]
end

# Test Collections
mel_seq = [64, 62, 60, 62, 52, 76, 64]
fr_Aug6 = [0,2,6,8]

# mel_seq = [64, 62, 60, 62, 52, 76, 64]
# julia> println(to_pc(mel_seq))
# [4, 2, 0, 2, 4, 4, 4]

# Intervals
# =========

# Ordered Pitch Intervals and Adjacent Interval Series
# ----------------------------------------------------

function opi(pcc)
	return [pcc[i+1] - pcc[i] for i in eachindex(pcc) if i < length(pcc)]
end

# mel_seq = [64, 62, 60, 62, 52, 76, 64];
# julia> println(opi(mel_seq))
# [-2, -2, 2, -10, 24, -12]

function ais(pcc)
	return opi(pcc)
end
# the adjacent interval series is the same as the opi thus the opi function is copied

# Unordered Pitch Intervals
# -------------------------

function upi(pcc)
	return [abs(pcc[i+1] - pcc[i]) for i in eachindex(pcc) if i < length(pcc)]
end

# mel_seq = [64, 62, 60, 62, 52, 76, 64];
# julia> println(upi(mel_seq))
# [2, 2, 2, 10, 24, 12]

# Ordered Pitch Class Intervals
# -----------------------------

function opci(pcc)
	return [i < 0 ? i+12 : i for i in [(pcc[i+1] - pcc[i]) % 12 for i in eachindex(pcc) if i < length(pcc)]]
end

# mel_seq = [64, 62, 60, 62, 52, 76, 64];
# julia> println(opci(mel_seq))
# [10, 10, 2, 2, 0, 0]

# Unordered Pitch Class Intervals and Interval Classes
# ----------------------------------------------------

function upci(pcc)
	x = [i < 0 ? i+12 : i for i in [(pcc[i+1] - pcc[i]) % 12 for i in eachindex(pcc) if i < length(pcc)]]
	y = [i < 0 ? i+12 : i for i in [(pcc[i] - pcc[i+1]) % 12 for i in eachindex(pcc) if i < length(pcc)]]
	ic = [i[1] < i[2] ? i[1] : i[2] for i in zip(x,y)]
	return ic
end

# mel_seq = [64, 62, 60, 62, 52, 76, 64];
# julia> println(upci(mel_seq))
# [2, 2, 2, 2, 0, 0]

function ic(pcc)
	return upci(pcc)
end

# the result of the ic function is the same as the upci function

# Collections
# -----------

function wt(type)
	return collect(type:2:11)
end

# Whole Tone Collection 0 WT0
# julia> println(wt(0))
# [0, 2, 4, 6, 8, 10]

# Whole Tone Collection 1 WT1
# julia> println(wt(1))
# [1, 3, 5, 7, 9, 11]
