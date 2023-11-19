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

# Collections or Scales measured by intervals
# -------------------------------------------

ionian = [2,2,1,2,2,2,1]     # ionian mode / major mode
dorian = [2,1,2,2,2,1,2]     # dorian mode (minor)
phrygian = [1,2,2,2,1,2,2]   # phrygian mode (minor)
lydian = [2,2,2,1,2,2,1]     # lydian mode (major)
mixolydian = [2,2,1,2,2,1,2] # mixolydian mode (major)
aeolian = [2,1,2,2,1,2,2]    # aeolian mode (minor)
locrian = [1,2,2,1,2,2,2]    # locrian mode (minor)
melodic = [2,1,2,2,2,2,1]    # melodic minor
harmonic = [2,1,2,2,1,3,1]   # melodic minor
prem = [2,2,2,2,2]           # whole tone
deux_12 = [1,2,1,2,1,2,1]    # oct 1–2 ordering
deux_21 = [2,1,2,1,2,1,2]    # oct 2-1 ordering
troi = [2,1,1,2,1,1,2,1,1]   # Messiaen's third mode of limited transposition
quat = [1,1,3,1,1,1,3,1]     # Messiaen's fourth mode of limited transposition
cinq = [1,4,1,1,4,1]         # Messiaen's sixth mode of limited transposition
sixe = [2,2,1,1,2,2,1,1]     # Messiaen's sixth mode of limited transposition
sept = [1,1,1,2,1,1,1,1,2,1] # Messiae's sixth mode of limited transpostion
hex_13 = [1,3,1,3,1]         # hex 1-3 ordering
hex_31 = [3,1,3,1,3]         # hex 3-1 ordering

# Building a scale. First argument is the starting PC, second argument is the scale type.
# The scale types are defined through their adjacent interval series

function scales(s=0,ntvls=[2,2,1,2,2,2,1])

    pcs=[]
    pc = append!(pcs,s)   
    [append!(pcs,(ntvls[i]+pc[i]) % 12) for i in eachindex(ntvls)]
    return pcs

end

# The default scale is C Major
# julia> println(scales())
# Any[0, 2, 4, 5, 7, 9, 11, 0]

# Hexatonic scale starting on PC 2 in 1–3 ordering
# julia> println(scales(2,hex_31))
# Any[2, 5, 6, 9, 10, 1]