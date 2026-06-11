# Installation Notes

Copy these folders/files into the root of your GitHub repository:

- `README.md`
- `docs/data_lineage.md`
- `docs/architecture/`
- `docs/decisions/`
- `sql/`
- `.github/workflows/validate.yml`

Before committing the GitHub Actions workflow, confirm that these scripts exist and run locally:

```bash
Rscript scripts/test.R
Rscript scripts/run.R
```

If either script still needs work, commit the workflow after the scripts run successfully.
