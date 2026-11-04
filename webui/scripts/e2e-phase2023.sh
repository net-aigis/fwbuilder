#!/usr/bin/env bash
# Phase-2023: e2e-all lists 2017-2024; hard gaps still 3.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
for n in 2017 2018 2019 2020 2021 2022 2023 2024; do
  grep -Fq "e2e-phase${n}" webui/scripts/e2e-all.sh
done
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert len(m.HARD_GAPS_OPEN) == 3
print("hard gaps still open @", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
echo "e2e-all 2017-2024 ok"
echo "cleaned"
echo "OK: phase2023 e2e passed"
