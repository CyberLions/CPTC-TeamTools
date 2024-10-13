# CCSO Pentest Report Template

## Configuration & Usage

1. Configure variables in the top section of `report.tex`
2. Edit `executive-summary.tex`
3. Add finding pages, and include them in `report.tex`
4. Add page breaks as needed with `\newpage`

## Troubleshooting Notes

What should I do if...

My table has text that's going off the page:

```latex
% Configure the begin line to change the column sizes, change the last c to a length that stays on the page such as 5.35in
\begin{tabular}{|c|p{5.35in}|}
```

My table isn't where I want it to be on the page:

```latex
% Add htp to allow the table to float on the page
\begin{table}[htp]
```