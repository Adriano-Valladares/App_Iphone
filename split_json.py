# split_json.py
import json
from pathlib import Path

src = Path("nonogramaV3.json")   # si tu JSON tiene otro nombre, cámbialo
outdir = Path("api")
outdir.mkdir(exist_ok=True)

data = json.loads(src.read_text(encoding="utf-8"))

index = []
for item in data:
    idv = item.get("id")
    if idv is None:
        continue
    file = outdir / f"{int(idv)}.json"
    file.write_text(json.dumps(item, ensure_ascii=False, indent=2), encoding="utf-8")
    index.append({
        "id": int(item.get("id")),
        "nombre": item.get("nombre"),
        "dificultad": item.get("dificultad"),
        "gridSize": item.get("gridSize"),
        "imagen": item.get("imagen", None)
    })

(outdir / "index.json").write_text(json.dumps(index, ensure_ascii=False, indent=2), encoding="utf-8")
print(f"Generados {len(index)} archivos en {outdir}")
