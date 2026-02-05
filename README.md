# ResMed Sleep Data Dashboard

## Purpose

A Next.js dashboard for visualizing ResMed CPAP sleep therapy data. Displays monthly sleep metrics including sleep scores, hours of use, mask leak rates, and therapy events from JSON data files.

## Tech Stack

- Next.js 16 with React 19 and TypeScript
- Tailwind CSS 4 for styling
- ApexCharts for data visualization
- Zod for data validation

## Development

```bash
npm install
npm run dev
```

The dev server runs on port 3030.

## Quality Checks

```bash
# Inner loop (run before committing)
./scripts/inner-loop-check.sh

# Type check only
npm run type-check

# Lint only
npm run lint
```
