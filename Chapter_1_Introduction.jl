### A Pluto.jl notebook ###
# v0.19.27

using Markdown
using InteractiveUtils

# ╔═╡ a07d0c82-9fb4-11ee-1b11-d5935ee99aaa
md"""
# Chapter 1: Introduction
"""

# ╔═╡ 30749254-8d86-491f-9fff-c5bc047aaff3
md"""
## Aren't there enough tools already? 

No, there will never be enough tools. We can re-use a lot, and we should, but languages, platforms, operating systems, computer systems fall out of favor at an ever rapid pace reflecting the ephemeral experience of our own existence. Once one system has been mastered, a new one will emerge, and another will simply not be supported anymore, even the one that has not been created yet.[^1]

The approach then should focus on learning the concepts and algorithms behind what exists in music theory itself conceptually, and to be able to apply these concepts or re-express these basic algorithms in any programming language. In this work the approach will be based on being able to program music theoretical algorithms in any programming language in order to be free from planned obsolescence. 

The primary algorithms will be derived from contemporary post-tonal analyses practices of western music theory.

All examples are categorized and demonstrated primarily using the [Julia programming language](https://julialang.org). [Python](https://www.python.org) also will be used, especially in conjunction with [music21](https://web.mit.edu/music21/), along with the [Humdrum toolkit](https://www.humdrum.org). Some demos will feature [Pd (Pure Data)](http://msp.ucsd.edu/software.html) examples, an open-source visual dataflow programming language used by many intermedia artists, musicians, and composers.[^2] Other demos yet will feature the [ChucK](https://chuck.cs.princeton.edu) language, a text-based audio processing/synthesis language.   

[^1]: Some may blame capitalism, others biological evolution, but it is undoubtedly part of our reality in the contemporary world of the early 21st century.
[^2]: **Pd** has been in existence since the late nineties and because it is openly maintained primarily by Miller S. Puckette, and many other enthusiastic users, it will possibly outlive many platforms maintained by corporate entities.
"""

# ╔═╡ Cell order:
# ╟─a07d0c82-9fb4-11ee-1b11-d5935ee99aaa
# ╟─30749254-8d86-491f-9fff-c5bc047aaff3
