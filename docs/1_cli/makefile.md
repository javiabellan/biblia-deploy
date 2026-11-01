# Makefile

## `Makefile` file:
```make
TargetFile: DepencyFile1, DepencyFile2
	command1
	command2
```

## Latex example `Makefile`
```make
paper.pdf: paper.tex plot-data.png
	pdflatex paper.tex

plot-%.png: %.dat plot.py
	./plot.py -i $*.dat -o $@
```

## Run it with `make`

If the DepencyFiles has not changed, the commands for TargetFile will not be executed.



## Multithread

Run `make`. If the build seems slow, try `make -j4` to use 4 threads.