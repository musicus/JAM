### A Pluto.jl notebook ###
# v0.19.27

using Markdown
using InteractiveUtils

# ╔═╡ 76c9439a-6632-41ed-9a66-b830e9dd44a7
# ╠═╡ disabled = true
#=╠═╡
include("post_tonal_tools.jl")
  ╠═╡ =#

# ╔═╡ 787ad2c6-614b-44a2-8a63-98baf09be8eb
md"""
# Chapter 1
"""

# ╔═╡ 4fb9ddbd-9004-4e60-86c0-76542fe59025
mel_seq = [64, 62, 60, 62, 52, 76, 64]

# ╔═╡ 6caceba5-6823-4628-9276-7775d6de1bd0
show(mel_seq)

# ╔═╡ 6b45a442-af5d-427a-a5ce-ef2ec0c7fd58
fr_Aug6 = [0, 2, 6, 8]

# ╔═╡ c6c5de7c-40cb-44c3-b11e-ce6eea202a40
show(fr_Aug6)

# ╔═╡ b4fbbb13-1f2e-4c21-bcdd-92e7419dbd1b
md"""
## Intervals
"""

# ╔═╡ 85b46b9b-e42e-4074-bd6a-7d32fbd2e1c2
md"""
### OPI
    opi(pcc)

Create Ordered Pitch Intervals (OPI) from a pitch class collection (pcc).
#### Examples
```jldoctest
# Double checking whether there is a mel_seq, if not mel_seq has to be defined.
julia> show(mel_seq)
[64, 62, 60, 62, 52, 76, 64]

julia> println(opi(mel_seq))
[-2, -2, 2, -10, 24, -12]
``` 
"""

# ╔═╡ b5bc5c16-aa31-40b2-a404-45f72199c9d9
function opi(pcc)
	return [pcc[i+1] - pcc[i] for i ∈ eachindex(pcc) if i < length(pcc)]
end

# ╔═╡ b32deaac-2b76-4fd8-893c-31ce15bd72b5
opi(fr_Aug6)

# ╔═╡ 4af2ee60-1f7d-4ae1-b3a6-62839d6d42a2
md"""
### UPI
    upi(pcc)

Create Unordered Pitch Intervals (UPI) from a pitch class collection (pcc).
#### Examples
```jldoctest
julia> show(mel_seq)
[64, 62, 60, 62, 52, 76, 64]

julia> println(upi(mel_seq))
[2, 2, 2, 10, 24, 12]
```
"""

# ╔═╡ ca9c128d-fd57-4a4f-83a8-0db7be21e2ee
upi(fr_Aug6)

# ╔═╡ 298850d5-a6f4-474e-8941-a018ed506291
md"""
### OPCI
    opci(pcc)

Create Ordered Pitch Class Intervals (OPCI) from a pitch class collection (pcc).
#### Examples
```jldoctest
julia> show(mel_seq)
[64, 62, 60, 62, 52, 76, 64]

julia> println(opci(mel_seq))
[10, 10, 2, 2, 0, 0]
```
"""

# ╔═╡ 09294b3a-2390-4226-9bf8-dc9b4d9b98ac
md"""
### UPCI
    upci(pcc)

Create Unordered Pitch Class Intervals (UPCI) from a pitch class collection (pcc).
#### Examples
```jldoctest
julia> show(mel_seq)
[64, 62, 60, 62, 52, 76, 64]

julia> println(upci(mel_seq))
[2, 2, 2, 2, 0, 0]
```
"""

# ╔═╡ a49f3330-39fb-400a-8534-2e6d19022bb0
md"""
### IC
    ic(pcc)

Create Interval Classes (IC) from a pitch class collection (pcc).
#### Examples
```jldoctest
julia> show(mel_seq)
[64, 62, 60, 62, 52, 76, 64]
	
julia> println(ic(mel_seq))
[2, 2, 2, 2, 0, 0]
```
"""

# ╔═╡ 29f1ffd5-556e-44f0-97c9-49db5185d9a2
md"""
### AIS
    ais(pcc)

Create an adjacent interval series (AIS), like the opi function, from a pitch class collection (pcc).
#### Examples
```jldoctest
julia> show(mel_seq)
[64, 62, 60, 62, 52, 76, 64]

julia> println(ais(mel_seq))
[-2, -2, 2, -10, 24, -12]
```
"""

# ╔═╡ Cell order:
# ╟─787ad2c6-614b-44a2-8a63-98baf09be8eb
# ╠═76c9439a-6632-41ed-9a66-b830e9dd44a7
# ╟─4fb9ddbd-9004-4e60-86c0-76542fe59025
# ╟─6caceba5-6823-4628-9276-7775d6de1bd0
# ╟─6b45a442-af5d-427a-a5ce-ef2ec0c7fd58
# ╟─c6c5de7c-40cb-44c3-b11e-ce6eea202a40
# ╟─b4fbbb13-1f2e-4c21-bcdd-92e7419dbd1b
# ╟─85b46b9b-e42e-4074-bd6a-7d32fbd2e1c2
# ╠═b5bc5c16-aa31-40b2-a404-45f72199c9d9
# ╠═b32deaac-2b76-4fd8-893c-31ce15bd72b5
# ╟─4af2ee60-1f7d-4ae1-b3a6-62839d6d42a2
# ╠═ca9c128d-fd57-4a4f-83a8-0db7be21e2ee
# ╟─298850d5-a6f4-474e-8941-a018ed506291
# ╟─09294b3a-2390-4226-9bf8-dc9b4d9b98ac
# ╟─a49f3330-39fb-400a-8534-2e6d19022bb0
# ╟─29f1ffd5-556e-44f0-97c9-49db5185d9a2
