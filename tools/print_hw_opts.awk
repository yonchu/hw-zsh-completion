# hw --help | awk -f <this file>
# vim: ft=awk sw=2 ts=2 et

BEGIN {
  OPT_NUM = -1
  SUB_NR = 0
  split("", OPTS)
  split("", OPT_DESC)
}
(/^.* options:$/ || /^Context control:$/), NF == 0 {
  SUB_NR++
  if ($0 ~ /^[^- ].*:$/) {
    next
  }
  if (SUB_NR == 1 || NF == 0) next
  sub(/^[ \t]+/, "")
  sub(/[ \t]+$/, "")
  if ($0 ~ /^-/) {
    OPT_NUM++
    match($0, "^-[^ ]+( --[^ ]+)* +")
    OPTS[OPT_NUM] = substr($0, RSTART, RLENGTH)
    OPT_DESC[OPT_NUM] = substr($0, RSTART + RLENGTH)
  } else {
    OPT_DESC[OPT_NUM] = OPT_DESC[OPT_NUM] " " $0
  }
}

END {
  for (i = 0; i <= OPT_NUM; i++) {
    opt_hunk = OPTS[i]
    gsub(/ /, "", opt_hunk)
    split(opt_hunk, opt_comp, ",")
    if (length(opt_comp) == 1) {
      printf "'(%s)%s[%s]'\n", opt_hunk, opt_comp[1], OPT_DESC[i]
    } else if (length(opt_comp) == 2) {
      printf "'(%s)'{%s,%s}'[%s]'\n", opt_hunk, opt_comp[1], opt_comp[2], OPT_DESC[i]
    }
  }
}
