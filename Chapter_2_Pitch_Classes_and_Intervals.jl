### A Pluto.jl notebook ###
# v0.19.27

using Markdown
using InteractiveUtils

# ╔═╡ 219c88ad-4856-4cd2-9c8e-4e1f8cec9b58
include("post_tonal_tools_min.jl")

# ╔═╡ 787ad2c6-614b-44a2-8a63-98baf09be8eb
md"""
# Chapter 2: Pitch Classes and Intervals
"""

# ╔═╡ e742dd30-3666-403a-82c9-513329cb7ac1
md"""
## Pitch Class

A pitch class (```PC```)[^1] is any name associated with the sensation of a quasi-discrete sounding pitch, for example:

	C, do, etc.

## Pitch Space

A pitch space (```PS```) designates where a ```PC``` is situated in a pitch space region, e.g.:

	C4

```C4``` known as middle ```C```, MIDI pitch ```60```, or ```261.625565```Hz, consists of a ```PC``` name and a unique number with an assigned pitch space region (```PCR```). The ```PCR``` is named so, because it is a specific collection of ```PCs```, e.g.: ```C4``` is located in region 4, but so are ```C#4```, ```D4```, and ```D#4```. ```F5``` would then be located in region 5, alongside its other siblings like ```C5```, etc.

## Pitch Class Integer Notation

If we want to measure distances between pitch classes (```PCs```) it would be beneficial to assign integers to pitch ```PCs```. In the equal temperament system, or ```12-ET``` we can generate the following table of ```PC``` to integer correlations: 


| PC name | Singable[^2] | Integer |
|:---|:---:|---:|
| C | do | 0 |
| C# | di | 1 |
| D | re | 2 |
| D# | ri | 3 |
| E | mi | 4 |
| F | fa | 5 |
| F# | fi | 6 |
| G | so | 7 |
| Ab | le | 8 |
| A | la | 9 |
| Bb | te | 10 (T)[^3] |
| B | ti | 11 (L)[^4] |
| C | do | 0 |


Can other tuning systems exist, and thereby create other musical universes? Yes, each tuning system comes with its own musical universe, one should really consider them multiverses. The ensuing table shows what a 24-ET system would look like:


| PC name | Singable[^5] | Integer |
|:---|:---:|---:|
| C | c | 0 |
| C1q# | cas | 1 |
| C# | cis | 2 |
| C3q# | cos | 3 |
| D | D | 4 |
| D1q# | das | 5 |
| D# | dis | 6 |
| D3q# | dos | 7 |
| E | E | 8 |
| E1q# | eis | 9 |
| F | F | 10 |
| F1q# | fas | 11 |
| F# | fis | 12 |
| F3q# | fos | 13 |
| G | G | 14 |
| G1q# | gas | 15 |
| G# | gis | 16 |
| G3q# | gos | 17 |
| A | a | 18 |
| A1q# | aes | 19 |
| A# | is | 20 |
| A3q# | aus | 21 |
| B | B | 22 |
| B1q# | bas | 23 |
| C | C | 0 |


We will limit our discussion to the ```12-ET``` system's universe, for now, muahahaha...

[^1]: ```PC``` singular; ```PCs``` plural.
[^2]: Really Italian note names, but singable due to their monosyllbic nature.
[^3]: In the duodecimal system of mathematics we would use A here, but in music A is already given to a note as a ```PC``` name, so ```T``` for ten has been chosen. 
[^4]: In the duodecimal system of mathematics we would use ```B``` here, but in music ```B``` already has been given to a note as a PC name, so ```L``` for ```lev``` (short for ```eleven```, yet singable) has been chosen. 
[^5]: German note names can also be sung, since they are monosyllabic as well. In this case I added the ```-as``` suffix for one-quarter-sharp, and the ```-os``` suffix for three-quarter-sharp, whenever possible, with the exceptions for PC A where I have added substitutions. Any other syllables or numbers could be borrowed or made up as long as they remain monosyllabic.

"""

# ╔═╡ 04d840f9-6d5e-4212-b32d-e920cf89d6a3
md"""
@TODO
"""

# ╔═╡ e009f034-649a-4352-b92b-355f63e19d37
md"""
Using a minimized file (for now) to get the post tonal tools into the Pluto.jl workspace.
"""

# ╔═╡ 4fb9ddbd-9004-4e60-86c0-76542fe59025
melody = [64, 62, 60, 62, 52, 76, 64]

# ╔═╡ 6b45a442-af5d-427a-a5ce-ef2ec0c7fd58
fr_Aug6 = [0, 2, 6, 8]

# ╔═╡ 31118d26-aaba-40df-86a9-fd8652b1db20
md"""
## Enharmonic Equivalence
"""

# ╔═╡ f5cc3b93-690f-4cef-81c3-40bdd602845b
md"""
Now that we have asigned integers to pitches, we can assign ```PC``` names to their corresponding integers in a matrix. The ```n_equiv``` matrix's first column consists of the integer ```PC``` names, the second column lists the integer names as they could be sung numerically, the third column shows the English ```PC``` names favoring sharps, the fourth column shows the English ```PC``` names favoring flats, etc. The enharmonic equivalence matrix can hypthetically be expanded indefinitely.
"""

# ╔═╡ 96330bfc-2df7-4e41-984a-40f880471e6c
"""
	n_equiv

Enharmonic pitch class array.
"""
n_equiv = [0 "Oh" "C" "C" "B#" "Do" "Do" "C" "C";
    1 "One" "C#" "Db" "Bx" "Di" "Ra" "Cis" "Des";
    2 "Two" "D" "D" "Cx" "Re" "Re" "D" "D";
    3 "Three" "D#" "Eb" "D#" "Ri" "Me" "Dis" "Es";
    4 "Four" "E" "Fb" "Dx" "Mi" "Mi" "E" "E";
    5 "Five" "F" "F" "E#" "Fa" "Fa" "F" "F";
    6 "Six" "F#" "Gb" "Ex" "Fi" "Se" "Fis" "Ges";
    7 "Sev" "G" "G" "Fx" "Sol" "Sol" "G" "G";
    8 "Eight" "G#" "Ab" "G#" "Si" "Le" "Gis" "As";
    9 "Nine" "A" "A" "Gx" "La" "La" "A" "A";
    10 "Ten" "A#" "Bb" "A#" "Li" "Te" "Ais" "B";
    11 "Lev" "B" "Cb" "Ax" "Ti" "Ti" "H" "H";]

# ╔═╡ 9d2e515d-85d1-4ccb-9831-6cee4c2ec2c2
n_equiv

# ╔═╡ becce23b-4d6a-4667-bba5-4c5c4be09789
"""
	enharmonic(pc)

The *enharmonic(pc)* function finds the enharmonic pitch class from any traditioanl pitch class name (English only, for now) and converts it to an integer pitch class.
"""
function enharmonic(pc=0)
	pitch = findall(x -> x==pc, n_equiv)
	return n_equiv[pitch[1][1]]
end

# ╔═╡ 8593e71a-9139-4000-8faf-4838d3b97ed7
md"""
Accessing different PC names, resulting always as integer PC name 1:
"""

# ╔═╡ cd21f6c7-746b-438e-b33c-5573c21e53c7
enharmonic("Ra")

# ╔═╡ 501b3ff8-1ca3-48e7-a055-a45adc08b4e3
enharmonic("Di")

# ╔═╡ 0febd801-151d-445b-af2d-9fcd00d845c2
enharmonic("Cis")

# ╔═╡ 213af447-f991-49ab-abd6-66efbe0c62cb
enharmonic("Bx")

# ╔═╡ 6447854a-e630-4727-81f9-b83695320611
md"""
## Octave Equivalence
"""

# ╔═╡ c38c8548-d3ef-445b-af9b-4962699f3129
"""
	o_equiv(mel_seq)

Reduces MIDI pitches to pitch class integer notation.
"""
function o_equiv(pcc=[64,62,60,62,52,76,64])
	return [i % 12 for i ∈ pcc]
end

# ╔═╡ 13e1c54a-05e7-46bb-9264-efa88aaa6570
o_equiv(mel_seq)

# ╔═╡ b4fbbb13-1f2e-4c21-bcdd-92e7419dbd1b
md"""
## Intervals
"""

# ╔═╡ 5cd79804-f8b4-44c0-8ae8-d01f24505f79
md"""
In case one is so inclined of wanting to use 'regular' music terms for intervals, one can create an array of interval names. The first index of the array carries the interval in enharmonic interval integer notation, followed by a column of English interval names, followed a column of German interval names. When additional music terms are desired an additional column can be created within the array. 
"""

# ╔═╡ 45ca83f0-7a2f-42f0-80b5-d6ac6022685b
"""
	interval_names

An array of interval names.
"""
interval_names = [
	0 "unison" "reine Prime" "unisson";
	1 "minor second" "kleine Sekunde" "seconde mineure";
	2 "major second" "große Sekunde" "seconde majeure";
	3 "minor third" "kleine Terz" "tierce mineure";
	4 "major third" "große Terz" "tierce majeure";
	5 "perfect fourth" "reine Quarte" "quarte";
	6 "tritone" "Tritonus" "triton";
	7 "perfect fifth" "reine Quinte" "quinte";
	8 "minor sixth" "kleine Sexte" "sixte mineure";
	9 "major sixth" "große Sekunde" "sixte majeure";
	10 "minor seventh" "kleine Septime" "septième mineure";
	11 "major seventh" "große Septime" "septième majeure";
	12 "perfect octave" "reine Oktave" "octave juste";
	13 "minor ninth" "kleine None" "neuvième mineure";
	14 "major ninth" "große None" "neuvième majeure";
	15 "minor tenth" "kleine Dezime" "dixième mineure";
	16 "major tenth" "große Dezime" "dixième majeure";
]

# ╔═╡ 30b19a27-57e4-4199-ae1c-075a13e326f5
function get_interval_int(interval="perfect unison")
	interval_name = findall(x -> x==interval, interval_names)
	return interval_names[interval_name[1][1]]
end

# ╔═╡ 305c8228-16e6-43ae-ab1e-2ce2221865e0
get_interval_int("seconde mineure")

# ╔═╡ 9ab96316-08ad-475d-a769-9c175391ab8b
"""
### OPI
    opi(pcc)

Create Ordered Pitch Intervals (OPI) from a pitch class collection (pcc).
"""
function opi(pcc)
	return [pcc[i+1] - pcc[i] for i ∈ eachindex(pcc) if i < length(pcc)]
end

# ╔═╡ b32deaac-2b76-4fd8-893c-31ce15bd72b5
opi(fr_Aug6)

# ╔═╡ 71ff8f0f-89e8-47f9-b610-3b8776336edb
opi(mel_seq)

# ╔═╡ 29f1ffd5-556e-44f0-97c9-49db5185d9a2
md"""
### AIS
    ais(pcc)

Create an adjacent interval series (AIS), like the opi function, from a pitch class collection (pcc).

The AIS is identical to the OPI.
"""

# ╔═╡ 8a9de060-d05c-406c-891c-576e9c4a958f
ais(fr_Aug6)

# ╔═╡ 7c973326-b13d-4348-97f0-40e7a3ea868a
ais(melody)

# ╔═╡ 4af2ee60-1f7d-4ae1-b3a6-62839d6d42a2
md"""
### UPI
    upi(pcc)

Create Unordered Pitch Intervals (UPI) from a pitch class collection (pcc).
"""

# ╔═╡ ca9c128d-fd57-4a4f-83a8-0db7be21e2ee
upi(fr_Aug6)

# ╔═╡ be81a8af-d4ee-4c38-856a-c8471e548700
upi(mel_seq)

# ╔═╡ 298850d5-a6f4-474e-8941-a018ed506291
md"""
### OPCI
    opci(pcc)

Create Ordered Pitch Class Intervals (OPCI) from a pitch class collection (pcc).
"""

# ╔═╡ c9b91dbe-a229-4c47-a45c-41d9023c0256
opci(fr_Aug6)

# ╔═╡ 97926bb8-5936-4e70-bc41-0936cbd41b11
opci(mel_seq)

# ╔═╡ 09294b3a-2390-4226-9bf8-dc9b4d9b98ac
md"""
### UPCI
    upci(pcc)

Create Unordered Pitch Class Intervals (UPCI) from a pitch class collection (pcc).
"""

# ╔═╡ 5518a798-6eb3-4508-a48b-77a312b5c471
upci(fr_Aug6)

# ╔═╡ a9b7a786-9816-455b-996b-64d8bfff9f49
upci(mel_seq)

# ╔═╡ 3e2c2451-031b-4b4a-9d02-158f327a7a99
md"""
## Interval Class Vector (ICV)
"""

# ╔═╡ a49f3330-39fb-400a-8534-2e6d19022bb0
md"""
### IC
    ic(pcc)

Create Interval Classes (IC) from a pitch class collection (pcc).

The IC is identical to the UPCI.
"""

# ╔═╡ 6c8d04ad-0fcb-490f-971a-b8b07b36bef5
ic(fr_Aug6)

# ╔═╡ 417bfb40-0179-4e1d-bc45-da230d83dddf
ic(mel_seq)

# ╔═╡ 11652658-7667-4d22-8aa5-577853fa63c2
#md"""
## Spacing and Register
#"""

# ╔═╡ Cell order:
# ╟─787ad2c6-614b-44a2-8a63-98baf09be8eb
# ╟─e742dd30-3666-403a-82c9-513329cb7ac1
# ╟─04d840f9-6d5e-4212-b32d-e920cf89d6a3
# ╟─e009f034-649a-4352-b92b-355f63e19d37
# ╟─219c88ad-4856-4cd2-9c8e-4e1f8cec9b58
# ╟─4fb9ddbd-9004-4e60-86c0-76542fe59025
# ╟─6b45a442-af5d-427a-a5ce-ef2ec0c7fd58
# ╟─31118d26-aaba-40df-86a9-fd8652b1db20
# ╟─f5cc3b93-690f-4cef-81c3-40bdd602845b
# ╟─96330bfc-2df7-4e41-984a-40f880471e6c
# ╠═9d2e515d-85d1-4ccb-9831-6cee4c2ec2c2
# ╟─becce23b-4d6a-4667-bba5-4c5c4be09789
# ╟─8593e71a-9139-4000-8faf-4838d3b97ed7
# ╠═cd21f6c7-746b-438e-b33c-5573c21e53c7
# ╠═501b3ff8-1ca3-48e7-a055-a45adc08b4e3
# ╠═0febd801-151d-445b-af2d-9fcd00d845c2
# ╠═213af447-f991-49ab-abd6-66efbe0c62cb
# ╟─6447854a-e630-4727-81f9-b83695320611
# ╟─c38c8548-d3ef-445b-af9b-4962699f3129
# ╠═13e1c54a-05e7-46bb-9264-efa88aaa6570
# ╟─b4fbbb13-1f2e-4c21-bcdd-92e7419dbd1b
# ╟─5cd79804-f8b4-44c0-8ae8-d01f24505f79
# ╟─45ca83f0-7a2f-42f0-80b5-d6ac6022685b
# ╟─30b19a27-57e4-4199-ae1c-075a13e326f5
# ╠═305c8228-16e6-43ae-ab1e-2ce2221865e0
# ╟─9ab96316-08ad-475d-a769-9c175391ab8b
# ╠═b32deaac-2b76-4fd8-893c-31ce15bd72b5
# ╠═71ff8f0f-89e8-47f9-b610-3b8776336edb
# ╟─29f1ffd5-556e-44f0-97c9-49db5185d9a2
# ╠═8a9de060-d05c-406c-891c-576e9c4a958f
# ╠═7c973326-b13d-4348-97f0-40e7a3ea868a
# ╟─4af2ee60-1f7d-4ae1-b3a6-62839d6d42a2
# ╠═ca9c128d-fd57-4a4f-83a8-0db7be21e2ee
# ╠═be81a8af-d4ee-4c38-856a-c8471e548700
# ╟─298850d5-a6f4-474e-8941-a018ed506291
# ╠═c9b91dbe-a229-4c47-a45c-41d9023c0256
# ╠═97926bb8-5936-4e70-bc41-0936cbd41b11
# ╟─09294b3a-2390-4226-9bf8-dc9b4d9b98ac
# ╠═5518a798-6eb3-4508-a48b-77a312b5c471
# ╠═a9b7a786-9816-455b-996b-64d8bfff9f49
# ╟─3e2c2451-031b-4b4a-9d02-158f327a7a99
# ╟─a49f3330-39fb-400a-8534-2e6d19022bb0
# ╠═6c8d04ad-0fcb-490f-971a-b8b07b36bef5
# ╠═417bfb40-0179-4e1d-bc45-da230d83dddf
# ╟─11652658-7667-4d22-8aa5-577853fa63c2
