### A Pluto.jl notebook ###
# v0.19.27

using Markdown
using InteractiveUtils

# ╔═╡ 219c88ad-4856-4cd2-9c8e-4e1f8cec9b58
include("post_tonal_tools_min.jl")

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

# ╔═╡ b4fbbb13-1f2e-4c21-bcdd-92e7419dbd1b
md"""
## Intervals
"""

# ╔═╡ 85b46b9b-e42e-4074-bd6a-7d32fbd2e1c2
md"""
### OPI
    opi(pcc)

Create Ordered Pitch Intervals (OPI) from a pitch class collection (pcc).
"""

# ╔═╡ b32deaac-2b76-4fd8-893c-31ce15bd72b5
opi(fr_Aug6)

# ╔═╡ 71ff8f0f-89e8-47f9-b610-3b8776336edb
opi(mel_seq)

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

# ╔═╡ Cell order:
# ╟─787ad2c6-614b-44a2-8a63-98baf09be8eb
# ╟─e009f034-649a-4352-b92b-355f63e19d37
# ╟─219c88ad-4856-4cd2-9c8e-4e1f8cec9b58
# ╟─4fb9ddbd-9004-4e60-86c0-76542fe59025
# ╟─6b45a442-af5d-427a-a5ce-ef2ec0c7fd58
# ╟─b4fbbb13-1f2e-4c21-bcdd-92e7419dbd1b
# ╟─85b46b9b-e42e-4074-bd6a-7d32fbd2e1c2
# ╠═b32deaac-2b76-4fd8-893c-31ce15bd72b5
# ╠═71ff8f0f-89e8-47f9-b610-3b8776336edb
# ╟─4af2ee60-1f7d-4ae1-b3a6-62839d6d42a2
# ╠═ca9c128d-fd57-4a4f-83a8-0db7be21e2ee
# ╠═be81a8af-d4ee-4c38-856a-c8471e548700
# ╟─298850d5-a6f4-474e-8941-a018ed506291
# ╠═c9b91dbe-a229-4c47-a45c-41d9023c0256
# ╠═97926bb8-5936-4e70-bc41-0936cbd41b11
# ╟─09294b3a-2390-4226-9bf8-dc9b4d9b98ac
# ╠═5518a798-6eb3-4508-a48b-77a312b5c471
# ╠═a9b7a786-9816-455b-996b-64d8bfff9f49
# ╟─a49f3330-39fb-400a-8534-2e6d19022bb0
# ╠═6c8d04ad-0fcb-490f-971a-b8b07b36bef5
# ╠═417bfb40-0179-4e1d-bc45-da230d83dddf
# ╟─29f1ffd5-556e-44f0-97c9-49db5185d9a2
# ╠═8a9de060-d05c-406c-891c-576e9c4a958f
# ╠═7c973326-b13d-4348-97f0-40e7a3ea868a
