#!/usr/bin/env python3
"""Generate TAGS.md: a tag -> problems index built from every note's
`**Tags:**` first line.

Run from anywhere:  python3 scripts/gen_tags_index.py
It rewrites TAGS.md at the repo root. The tag vocabulary below must stay
in sync with the "Tag Vocabulary" section of CONTRIBUTING.md.
"""
import os, re, glob

# repo root = parent of the scripts/ directory holding this file
REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(REPO)

TIER1 = "dp graph tree bst linked-list stack heap dsu trie strings prefix-sum binary-search greedy intervals number-theory bit-manipulation implementation range-queries geometry math".split()
TIER2 = ("constructive brute-force divide-and-conquer two-pointers sliding-window binary-search-on-answer backtracking meet-in-the-middle ternary-search interactive game-theory offline-queries fast-slow-pointers boyer-moore-voting inversion-count "
         "knapsack unbounded-knapsack lis grid-dp fibonacci-dp tree-dp state-compression interval-dp digit-dp bitmask-dp probability-dp lcs edit-distance kadane dp-optimization counting-dp subset-sum linear-dp "
         "bfs dfs flood-fill topological-sort dijkstra 01-bfs multisource-bfs mst shortest-path bellman-ford floyd-warshall scc bridges-articulation 2-sat bipartite eulerian-path functional-graph max-flow bipartite-matching lca binary-lifting euler-tour heavy-light-decomposition centroid-decomposition dag-dp tree-traversal morris-traversal "
         "monotonic-stack monotonic-deque hashmap two-sum difference-array segment-tree fenwick-tree sparse-table sqrt-decomposition mos-algorithm ordered-set top-k "
         "string-hashing kmp z-function suffix-array aho-corasick manacher "
         "gcd-lcm modular-arithmetic sieve catalan combinatorics binomial-coefficients inclusion-exclusion modular-inverse crt binary-exponentiation matrix-exponentiation fft factorization "
         "sorting coordinate-compression custom-comparator convex-hull sweep-line line-intersection").split()
T1, T2 = set(TIER1), set(TIER2)

link_re = re.compile(r'\[([^\]]+)\]')


def title_of(path, lines):
    """First markdown link text after the tags line, else the filename."""
    for ln in lines[1:]:
        m = link_re.search(ln)
        if m:
            return m.group(1).strip()
    return os.path.splitext(os.path.basename(path))[0]


# tag -> list of (title, path)
index = {}
n_files = 0
for path in glob.glob("**/*.md", recursive=True):
    if path.startswith(".git"):
        continue
    with open(path, encoding="utf-8") as fh:
        lines = fh.read().splitlines()
    if not lines or not lines[0].startswith("**Tags:**"):
        continue
    n_files += 1
    tags = lines[0].replace("**Tags:**", "").split()
    title = title_of(path, lines)
    for t in tags:
        index.setdefault(t, []).append((title, path))


def section(heading, tagset):
    out = [f"## {heading}\n"]
    for tag in sorted(tagset):
        if tag not in index:
            continue
        items = sorted(set(index[tag]))
        out.append(f"### `{tag}` ({len(items)})\n")
        for ttl, p in items:
            out.append(f"- [{ttl}](/{p})")
        out.append("")
    return "\n".join(out)


unknown = sorted(set(index) - T1 - T2)
body = [
    "# 🏷️ Tag Index",
    "",
    f"_Auto-generated from the `**Tags:**` line of each note ({n_files} tagged files). "
    "Do not edit by hand — regenerate with `python3 scripts/gen_tags_index.py`. "
    "See [CONTRIBUTING.md](/CONTRIBUTING.md#tag-vocabulary) for the controlled vocabulary._",
    "",
    section("Categories", T1),
    section("Techniques", T2),
]
if unknown:
    body.append(section("Uncategorized (not in vocabulary — review)", set(unknown)))

with open("TAGS.md", "w", encoding="utf-8") as fh:
    fh.write("\n".join(body).rstrip() + "\n")

print(f"TAGS.md written: {n_files} files, {len(index)} distinct tags in use.")
print("  ⚠ tags not in vocabulary:", unknown) if unknown else print("  all tags in vocabulary ✓")
