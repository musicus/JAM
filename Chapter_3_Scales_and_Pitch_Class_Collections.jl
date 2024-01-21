### A Pluto.jl notebook ###
# v0.19.27

using Markdown
using InteractiveUtils

# ╔═╡ 9c2ffba8-515c-4ae5-a316-eddf787dcb8a
include("post_tonal_tools_min.jl")

# ╔═╡ d72ae558-8e8c-11ee-1171-ebca48c5f0fd
md"""
# Chapter 3: Scales and PC Collections
"""

# ╔═╡ 2ec38d75-301c-400e-9844-4359b87244b7
md"""

## The Scale Design Pattern
### a.k.a. *Pitch Class Collections*

Scales are deliberate pitch class (PC) sequences. PC sequences are not melodies–although by changing the rhythm of one PC, a scale can become a melody–but can be seen as interchangeable, and sharable building blocks for melodies. We can learn to use different computational tools to show and construct scales, but we can also learn a scale design pattern that's applicable to most/all scales, and any chosen coding platform can utilize the scale design pattern. The problem has been thought about many times: What is an easy way to (en)code scales in music? Myke Cuthbert and Christopher Ariza came up with a very elegant solution in [music21](https://web.mit.edu/music21/), for which they created a [network-based scale model](https://d1wqtxts1xzle7.cloudfront.net/6799615/scalenetwork-libre.pdf?1390848207=&response-content-disposition=inline%3B+filename%3DANALYTICAL_AND_COMPOSITIONAL_APPLICATION.pdf&Expires=1701469949&Signature=BDMChpDA5xwEixOv4V9fouCBT62~AuZwHqkDxcv-hbdJa~lUiFfCkIbWw5xtbbhyLppE83Wt6j0~t31BxszRTaKvM0MA-g9ba2wN-RtzJBThvqlhS4i4Q315Qa1OpLg0vn3Rqu-TECfQbxsrjDjt-11H3qCPL65nybqY3bdie6jKBDZFx2U2FQ4m5NNupWGbSzuN8Gc6WEVGAtO~J2saIb4lMvA~f8cT2Eg9xX9FMP7zNj~UAIbWXO-ZQ~fnwh8nAVAiUicSgK2wss4WLgOD8EsgdCQCrh5FpuIPzg-3JfkmzEur81muHDi-1-ncVDVfTPmhaL41a92IU9y2oVzjTg__&Key-Pair-Id=APKAJLOHF5GGSLRBV4ZA). The [Scala](https://www.huygens-fokker.org/scala/) software (written in [Ada](https://en.wikipedia.org/wiki/Ada_(programming_language))) has a solution for the problem (their website also has a [list of scales](https://www.huygens-fokker.org/docs/modename.html)). [Humdrum](https://www.humdrum.org) [extras](https://extras.humdrum.org) also provides a solution with the [```scaletype```](https://extras.humdrum.org/man/scaletype/) tool. Although the latter two solutions are not concerned as much with illustrating how to code solutions to the problem.

Music Theory provides us with a practical tool to dream up a solution:

- the **A**djacent **I**nterval **S**eries (AIS)

The AIS measures what types of intervals occur between a set of notes, or a PC collection (traditionally defined as chords, melodies or melodic fragments, and scales). For example, a C Major scale consisting of the adjacent ascending pitches of ```C, D, E, F, G, A, B, C``` can be constructed by measuring the intervals between the adjacent pitches (the last ```C``` indicates an octave displaced pitch space shift): 

- C to D is a wholestep
- D to E is a wholestep
- E to F is a halfstep
- F to G is a wholestep
- G to A is a wholestep 
- A to B is a wholestep
- B to C is a halfstep  

The definition of what wholesteps and halfsteps are follows: 

- wholestep = 2 semitone
- halstep = 1 semitone

Naturally, a semitone is really an abritrary value, but one that is understood by most musicians familiar with western music theory and equal temperament (although equal temperament is not a requirement). The interval measuring process yields the AIS of ```<2,2,1,2,2,2,1>``` for the C Major scale. Thus we can create any Major scale starting on any given PC. For example, beginning on PC 2, or D, all we have to do is add the numbers from the adjacent interal series sequentially to create the Major scale:

	D + wholestep = E
	D, E + wholestep = F#
	D, E, F# + halfstep = G
	D, E, F#, G, + wholestep = A
	D, E, F#, G, A, + wholestep = B
	D, E, F#, G, A, B + wholestep = C#
	D, E, F#, G, A, B, C# + halfstep = D

	makes D, E, F#, G, A, B, C#, D

Expressed as PCs in integers:

	2 + <2> = 4
	2, 4 + <2> = 6
	2, 4, 6 + <1> = 7
	2, 4, 6, 7 + <2> = 9
	2, 4, 6, 7, 9 + <2> = L
	2, 4, 6, 7, 9, L, + <2> = 1
	2, 4, 6, 7, 9, L, 1 + <1> = 2

	makes 2, 4, 6, 7, 9, L, 1, 2

Applying an AIS does not depend on scale length–whether we are dealing with a pentatonic, hexatonic, heptatonic, or other n-tonic scale, or PC collections–nor tuning system. 

"""

# ╔═╡ c7140fe5-45b3-4811-a2fa-0d746436cdea
md"""
### Coding the Scale Pattern
What we are after is being able to analyze any given scale or melodic pattern by passing the passage or pitch class sequence to a function that returns the ```AIS```.

"""

# ╔═╡ 9ec0d7cb-8c45-41b9-9ce3-55524b3712a7
melody = [64, 62, 60, 62, 52, 76, 64]

# ╔═╡ 44bee630-4740-4d6e-836c-d13414c9bc91
"""
    ais(pcc)

Create an adjacent interval series (AIS), like the opi function, from a pitch class collection (pcc).

# Examples

```jldoctest

julia> show(melody)
[64, 62, 60, 62, 52, 76, 64]

julia> println(ais(melody))
[-2, -2, 2, -10, 24, -12]

```
"""
function ais(pcc)
	return [pcc[i+1] - pcc[i] for i ∈ eachindex(pcc) if i < length(pcc)]
end

# ╔═╡ f4ca900d-7d75-47f2-901d-8e825c5c78e1
ais(melody)

# ╔═╡ 287b4f09-5b6b-4f6c-8e5a-1c454f2411fa
md"""
## Common Scales or Pitch Class Collections

### Whole Tone Collection
The whole tone collection consists of an AIS of six equally spaced PCs in equal temperament. The PCs are equally spaced by a Major second. Olivier Messiaen calls the whole tone collection the _premiere mode_, or first mode of limted transposition, since the resulting pitch class collection results in only two possible transpositions.

"""

# ╔═╡ Cell order:
# ╟─d72ae558-8e8c-11ee-1171-ebca48c5f0fd
# ╟─2ec38d75-301c-400e-9844-4359b87244b7
# ╟─c7140fe5-45b3-4811-a2fa-0d746436cdea
# ╠═9c2ffba8-515c-4ae5-a316-eddf787dcb8a
# ╠═9ec0d7cb-8c45-41b9-9ce3-55524b3712a7
# ╟─44bee630-4740-4d6e-836c-d13414c9bc91
# ╟─f4ca900d-7d75-47f2-901d-8e825c5c78e1
# ╠═287b4f09-5b6b-4f6c-8e5a-1c454f2411fa
