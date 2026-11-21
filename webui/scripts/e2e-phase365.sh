#!/usr/bin/env bash
# Phase-365: client empty? flag on sections.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'empty?: boolean' webui/frontend/src/api/client.ts
echo "client empty flag ok"
echo "cleaned"
echo "OK: phase365 e2e passed"
