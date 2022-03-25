awk_cmd="BEGIN{f=1} /^.*override def cloneType/{f=0} f{print} /\[this\.type\].*$/{f=1}"

for f in $(grep -rl "override def cloneType" $1);
do {
  echo Processing $f;
  gawk -i inplace $awk_cmd $f;
}
done;

