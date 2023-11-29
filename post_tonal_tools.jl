######################
#  Post-Tonal Tools  #
######################

# General
# ======= 

# Test Pitch Class Collections
mel_seq = [64, 62, 60, 62, 52, 76, 64]
fr_Aug6 = [0, 2, 6, 8]

"""
    midi_to_pc(pcc)

Converts midi pitch integers to pitch class integers, as a single pitch or pitch classes collections (pcc)

# Examples

```jldoctest

julia> mel_seq = [64, 62, 60, 62, 52, 76, 64]
7-element Vector{Int64}:
 64
 62
 60
 62
 52
 76
 64

# Running the midi_to_pc function and printing its results.
julia> println(midi_to_pc(mel_seq))
[4, 2, 0, 2, 4, 4, 4]

```
"""
function midi_to_pc(pcc)
	return [i % 12 for i ∈ pcc]
end

# Intervals
# =========

# Ordered Pitch Intervals and Adjacent Interval Series
# ----------------------------------------------------
"""
    opi(pcc)

Create Ordered Pitch Intervals (OPI) from a pitch class collection (pcc).
The OPI definition comes from Joseph N. Straus' "Introduction to Post-Tonal Music, 4th Edition." 

# Examples

```jldoctest

# Double checking whether there is a mel_seq, if not mel_seq has to be defined.
julia> show(mel_seq)
[64, 62, 60, 62, 52, 76, 64]

julia> println(opi(mel_seq))
[-2, -2, 2, -10, 24, -12]

``` 
"""
function opi(pcc)
	return [pcc[i+1] - pcc[i] for i ∈ eachindex(pcc) if i < length(pcc)]
end

"""
    ais(pcc)

Create an adjacent interval series (AIS), like the opi function, from a pitch class collection (pcc).
The AIS definition comes from Joseph N. Straus' "Introduction to Post-Tonal Music, 4th Edition." 

# Examples

```jldoctest

julia> show(mel_seq)
[64, 62, 60, 62, 52, 76, 64]

julia> println(ais(mel_seq))
[-2, -2, 2, -10, 24, -12]

```
"""
function ais(pcc)
	return opi(pcc)
end

# Unordered Pitch Intervals
# -------------------------

"""
    upi(pcc)

Create Unordered Pitch Intervals (UPI) from a pitch class collection (pcc).
The UPI definition comes from Joseph N. Straus' "Introduction to Post-Tonal Music, 4th Edition." 

# Examples

```jldoctest

julia> show(mel_seq)
[64, 62, 60, 62, 52, 76, 64]

julia> println(upi(mel_seq))
[2, 2, 2, 10, 24, 12]

```
"""
function upi(pcc)
	return [abs(pcc[i+1] - pcc[i]) for i ∈ eachindex(pcc) if i < length(pcc)]
end

# Ordered Pitch Class Intervals
# -----------------------------

"""
    opci(pcc)

Create Ordered Pitch Class Intervals (OPCI) from a pitch class collection (pcc).
The OPCI definition comes from Joseph N. Straus' "Introduction to Post-Tonal Music, 4th Edition." 

# Examples

```jldoctest

julia> show(mel_seq)
[64, 62, 60, 62, 52, 76, 64]

julia> println(opci(mel_seq))
[10, 10, 2, 2, 0, 0]

```
"""
function opci(pcc)
	return [i < 0 ? i+12 : i for i ∈ [(pcc[i+1] - pcc[i]) % 12 for i ∈ eachindex(pcc) if i < length(pcc)]]
end
# Unordered Pitch Class Intervals and Interval Classes
# ----------------------------------------------------

"""
    upci(pcc)

Create Unordered Pitch Class Intervals (UPCI) from a pitch class collection (pcc).
The OPCI definition comes from Joseph N. Straus' "Introduction to Post-Tonal Music, 4th Edition." 

# Examples
```jldoctest

julia> show(mel_seq)
[64, 62, 60, 62, 52, 76, 64]

julia> println(upci(mel_seq))
[2, 2, 2, 2, 0, 0]

```
"""
function upci(pcc)
	x = [i < 0 ? i+12 : i for i ∈ [(pcc[i+1] - pcc[i]) % 12 for i ∈ eachindex(pcc) if i < length(pcc)]]
	y = [i < 0 ? i+12 : i for i ∈ [(pcc[i] - pcc[i+1]) % 12 for i ∈ eachindex(pcc) if i < length(pcc)]]
	ic = [i[1] < i[2] ? i[1] : i[2] for i ∈ zip(x,y)]
	return ic
end

"""
    ic(pcc)

Create Interval Classes (IC) from a pitch class collection (pcc).
The OPCI definition comes from Joseph N. Straus' "Introduction to Post-Tonal Music, 4th Edition." 
	
# Examples
```jldoctest
	
julia> show(mel_seq)
[64, 62, 60, 62, 52, 76, 64]
	
julia> println(ic(mel_seq))
[2, 2, 2, 2, 0, 0]
	
```
"""
function ic(pcc)
	return upci(pcc)
end

# Collections or Scales measured by intervals
# -------------------------------------------

ionian = [2,2,1,2,2,2,1]			# ionian mode / major mode
dorian = [2,1,2,2,2,1,2]			# dorian mode (minor)
phrygian = [1,2,2,2,1,2,2]			# phrygian mode (minor)
lydian = [2,2,2,1,2,2,1]			# lydian mode (major)
mixolydian = [2,2,1,2,2,1,2]		# mixolydian mode (major)
aeolian = [2,1,2,2,1,2,2]			# aeolian mode (minor)
locrian = [1,2,2,1,2,2,2]			# locrian mode (minor)
melodic = [2,1,2,2,2,2,1]			# melodic minor
harmonic = [2,1,2,2,1,3,1]			# melodic minor
first_m = [2,2,2,2,2]				# whole tone
oct_12 = [1,2,1,2,1,2,1]			# oct 1–2 ordering
oct_21 = [2,1,2,1,2,1,2]			# oct 2-1 ordering
third_m = [2,1,1,2,1,1,2,1,1]		# Messiaen's third mode of limited transposition
fourth_m = [1,1,3,1,1,1,3,1]		# Messiaen's fourth mode of limited transposition
fifth_m = [1,4,1,1,4,1]				# Messiaen's sixth mode of limited transposition
sixth_m = [2,2,1,1,2,2,1,1]			# Messiaen's sixth mode of limited transposition
seventh_m = [1,1,1,2,1,1,1,1,2,1]	# Messiae's sixth mode of limited transpostion
hex_13 = [1,3,1,3,1]				# hex 1-3 ordering
hex_31 = [3,1,3,1,3]				# hex 3-1 ordering

"""
    scales(pc=0,intervals=[2,2,1,2,2,2,1])
	
Generate a scale from a given pitch class (pc) by means of an adjacent interval series (intervals).

# Examples
```jldoctest

# The default scale is C Major
julia> println(scales())
Any[0, 2, 4, 5, 7, 9, 11, 0]
	
# Hexatonic scale starting on PC 2 in 3-1 ordering
julia> println(scales(2,hex_31))
Any[2, 5, 6, 9, 10, 1]

```
"""
function scales(pc=0,intervals=[2,2,1,2,2,2,1])
	pcs = Vector{Int64}()
    pcc = push!(pcs,pc)   
    [append!(pcs,(intervals[i]+pcc[i]) % 12) for i ∈ eachindex(intervals)]
    return pcs
end

# Pitch Class names
# -----------------
"""
	pc_names

A matrix of equivalent pitch class names: 

- Integers
- English
- Solfège
- German/Hungarian/Polish/Slovak/Slovenian/Estonian/Danish/Czech
- Dutch
- Norwegian/Swedish

# Examples
```jldoctest

# Using the scales function and pc_names matrix to create readable scale names
# Building a c minor scale

julia> show(c_minor)
Any[0, 2, 3, 5, 7, 8, 10, 0]

# viewing the scale in solfège names rather than integer names
julia> println([pc_names[i+1,3] for i in c_minor])
["do", "re", "me", "fa", "sol", "le", "te", "do"]

```
"""
pc_names = [0 "C" "do" "C" "C" "C";
    1 "C#" "di" "Cis" "Cis" "Ciss";
    2 "D" "re" "D" "D" "D";
    3 "Eb" "me" "Es" "Es" "Ess";
    4 "E" "mi" "E" "E" "E";
    5 "F" "fa" "F" "F" "F";
    6 "F#" "fi" "Fis" "Fis" "Fiss";
    7 "G" "sol" "G" "G" "G";
    8 "Ab" "le" "As" "As" "Ass";
    9 "A" "la" "A" "A" "A";
    10 "Bb" "te" "B" "Bes" "Bess";
    11 "B" "do" "H" "B" "H";]