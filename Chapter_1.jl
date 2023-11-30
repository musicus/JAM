### A Pluto.jl notebook ###
# v0.19.27

using Markdown
using InteractiveUtils

# ╔═╡ 219c88ad-4856-4cd2-9c8e-4e1f8cec9b58
println(include("post_tonal_tools_min.jl"))

# ╔═╡ 787ad2c6-614b-44a2-8a63-98baf09be8eb
md"""
# Chapter 1
"""

# ╔═╡ e009f034-649a-4352-b92b-355f63e19d37
md"""
Using a minimized file (for now) to get the post tonal tools into the Pluto.jl workspace.
"""

# ╔═╡ 4fb9ddbd-9004-4e60-86c0-76542fe59025
mel_seq = [64, 62, 60, 62, 52, 76, 64]

# ╔═╡ 6b45a442-af5d-427a-a5ce-ef2ec0c7fd58
fr_Aug6 = [0, 2, 6, 8]

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

# ╔═╡ 31118d26-aaba-40df-86a9-fd8652b1db20
md"""
## Enharmonic Equivalence
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
	clean_pc = uppercasefirst(pc)
	pitch = findall(x -> x==clean_pc, n_equiv)
	return n_equiv[pitch[1][1]]
end

# ╔═╡ cd21f6c7-746b-438e-b33c-5573c21e53c7
show(enharmonic(6))

# ╔═╡ b4fbbb13-1f2e-4c21-bcdd-92e7419dbd1b
md"""
## Intervals
"""

# ╔═╡ 45ca83f0-7a2f-42f0-80b5-d6ac6022685b
"""
	interval_names

An array of interval names.
"""
interval_names = [0 "unison";
	1 "minor second";
	2 "major second";
	3 "minor third";
	4 "major third";
	5 "perfect fourth";
	6 "tritone";
	7 "perfect fifth";
	8 "minor sixth";
	9 "major sixth";
	10 "minor seventh";
	11 "major seventh";
	12 "perfect octave";
	13 "minor ninth";
	14 "major ninth";
	15 "minor thenth";
	16 "major thenth";]

# ╔═╡ 30b19a27-57e4-4199-ae1c-075a13e326f5
function get_interval_int(interval="perfect unison")
	interval_name = findall(x -> x==interval, interval_names)
	return interval_names[interval_name[1][1]]
end

# ╔═╡ 305c8228-16e6-43ae-ab1e-2ce2221865e0
get_interval_int("minor sixth")

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
ais(mel_seq)

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
md"""
## Spacing and Register
"""

# ╔═╡ Cell order:
# ╟─787ad2c6-614b-44a2-8a63-98baf09be8eb
# ╟─e009f034-649a-4352-b92b-355f63e19d37
# ╟─219c88ad-4856-4cd2-9c8e-4e1f8cec9b58
# ╟─4fb9ddbd-9004-4e60-86c0-76542fe59025
# ╟─6b45a442-af5d-427a-a5ce-ef2ec0c7fd58
# ╟─6447854a-e630-4727-81f9-b83695320611
# ╠═c38c8548-d3ef-445b-af9b-4962699f3129
# ╠═13e1c54a-05e7-46bb-9264-efa88aaa6570
# ╟─31118d26-aaba-40df-86a9-fd8652b1db20
# ╠═96330bfc-2df7-4e41-984a-40f880471e6c
# ╠═9d2e515d-85d1-4ccb-9831-6cee4c2ec2c2
# ╠═becce23b-4d6a-4667-bba5-4c5c4be09789
# ╠═cd21f6c7-746b-438e-b33c-5573c21e53c7
# ╟─b4fbbb13-1f2e-4c21-bcdd-92e7419dbd1b
# ╟─45ca83f0-7a2f-42f0-80b5-d6ac6022685b
# ╠═30b19a27-57e4-4199-ae1c-075a13e326f5
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
