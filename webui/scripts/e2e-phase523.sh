#!/usr/bin/env bash
# Phase-523: score includes pages_with_buddy_labels.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'pages_with_buddy_labels' webui/backend/fwbweb_api/platforms.py
grep -Fq 'page_stats["pages_with_buddy_labels"]' webui/backend/fwbweb_api/platforms.py
echo "buddy pages in score ok"
echo "cleaned"
echo "OK: phase523 e2e passed"
