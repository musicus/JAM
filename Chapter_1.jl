### A Pluto.jl notebook ###
# v0.19.27

#> [frontmatter]
#> title = "Post Tonal Analysis Tools"
#> description = "A set of tools written in Julia to aide in the analysis of post tonal music"

using Markdown
using InteractiveUtils

# ╔═╡ 1ebd397d-db16-4d65-8afa-be29188894b1
md"""
# Chapter 1
## Intervals
### *OPI*

    opi(pcc)

Create Ordered Pitch Intervals (OPI) from a pitch class collection (pcc).
The OPI definition comes from Joseph N. Straus' "Introduction to Post-Tonal Music, 4th Edition." 

#### Examples

```jldoctest
# Double checking whether there is a mel_seq, if not mel_seq has to be defined.
julia> show(mel_seq)
[64, 62, 60, 62, 52, 76, 64]

julia> println(opi(mel_seq))
[-2, -2, 2, -10, 24, -12]

``` 

### *AIS*
    ais(pcc)

Create an adjacent interval series (AIS), like the opi function, from a pitch class collection (pcc).
The AIS definition comes from Joseph N. Straus' "Introduction to Post-Tonal Music, 4th Edition." 

#### Examples

```jldoctest
julia> show(mel_seq)
[64, 62, 60, 62, 52, 76, 64]

julia> println(ais(mel_seq))
[-2, -2, 2, -10, 24, -12]

```
### *UPI*

    upi(pcc)

Create Unordered Pitch Intervals (UPI) from a pitch class collection (pcc).
The UPI definition comes from Joseph N. Straus' "Introduction to Post-Tonal Music, 4th Edition." 

#### Examples
```jldoctest
julia> show(mel_seq)
[64, 62, 60, 62, 52, 76, 64]

julia> println(upi(mel_seq))
[2, 2, 2, 10, 24, 12]

```
"""

# ╔═╡ Cell order:
# ╠═1ebd397d-db16-4d65-8afa-be29188894b1
