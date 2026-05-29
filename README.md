# Godot PCK Explorer — Pre-built Releases

**Maintainer:** [@cokluk](https://github.com/cokluk) · **[Download releases](https://github.com/cokluk/GodotPCKExplorer/releases/latest)**

[![Releases](https://img.shields.io/github/v/release/cokluk/GodotPCKExplorer?label=download)](https://github.com/cokluk/GodotPCKExplorer/releases/latest)

Pre-built binaries for **Godot PCK Explorer** and **PCK Bruteforcer** — including packages that are missing or awkward to obtain from the upstream release page.

Fork of [DmitriySalnikov/GodotPCKExplorer](https://github.com/DmitriySalnikov/GodotPCKExplorer) (original author and source). This repo focuses on **ready-to-download builds** and [GitHub Actions](https://github.com/cokluk/GodotPCKExplorer/actions) packaging.

## Download

**[→ Latest releases (.zip)](https://github.com/cokluk/GodotPCKExplorer/releases/latest)**

Each release has one `.zip` per variant (UI / console, dotnet / native, per platform).

### Godot PCK Explorer (v1.6.0)

| Asset | Description |
|-------|-------------|
| `GodotPCKExplorer_*_dotnet-ui-win` | Windows UI (.NET 9 Desktop Runtime) |
| `GodotPCKExplorer_*_dotnet-console-win-linux-mac` | Console (`dotnet` on Win / Linux / macOS) |
| `GodotPCKExplorer_*_native-console-win-x64` | Standalone, 64-bit Windows |
| `GodotPCKExplorer_*_native-console-win-x86` | Standalone, 32-bit Windows |
| `GodotPCKExplorer_*_native-console-linux-x64` | Standalone, Linux x64 |
| `GodotPCKExplorer_*_native-console-mac-x64` | Standalone, macOS Intel |
| `GodotPCKExplorer_*_native-console-mac-arm64` | Standalone, macOS Apple Silicon |

### PCK Bruteforcer (v1.0.3)

Godot 4 PCK encryption key recovery. Details: [Bruteforcer/README.md](Bruteforcer/README.md).

| Asset | Description |
|-------|-------------|
| `PCKBruteforcer_*_dotnet-ui-win` | Windows UI (.NET 9 Desktop Runtime) |
| `PCKBruteforcer_*_dotnet-console-win-linux-mac` | Console (`dotnet` on Win / Linux / macOS) |
| `PCKBruteforcer_*_native-console-win-x64` | Standalone, 64-bit Windows |
| `PCKBruteforcer_*_native-console-win-x86` | Standalone, 32-bit Windows |
| `PCKBruteforcer_*_native-console-linux-x64` | Standalone, Linux x64 |
| `PCKBruteforcer_*_native-console-mac-x64` | Standalone, macOS Intel |
| `PCKBruteforcer_*_native-console-mac-arm64` | Standalone, macOS Apple Silicon |

> [!IMPORTANT]
> **`dotnet`** builds need [.NET 9](https://dotnet.microsoft.com/download/dotnet/9.0). UI builds need the **Desktop Runtime** on Windows.
>
> **`native`** builds are self-contained. Linux/macOS console binaries have no `.exe` extension.

## Build from source

[.NET 9 SDK](https://dotnet.microsoft.com/download/dotnet/9.0) required. Windows needed for UI projects.

```powershell
git clone https://github.com/cokluk/GodotPCKExplorer.git
cd GodotPCKExplorer
.\scripts\build.ps1
```

Output: `build/` (gitignored). Same folder names as release zips.

### CI / automatic releases

Workflow: [`.github/workflows/dotnet-desktop.yml`](.github/workflows/dotnet-desktop.yml)

- Push to `master` / `main` → artifacts under **Actions → release-zips**
- Tag `v1.6.0` and push → creates a **GitHub Release** with all zips:

```bash
git tag v1.6.0
git push origin v1.6.0
```

## Upstream

Feature documentation and screenshots: [upstream README](https://github.com/DmitriySalnikov/GodotPCKExplorer/blob/master/README.md) · [upstream releases](https://github.com/DmitriySalnikov/GodotPCKExplorer/releases/latest) · [issues](https://github.com/DmitriySalnikov/GodotPCKExplorer/issues) for core app bugs.

## License

MIT. See [LICENSE](LICENSE). Original copyright DmitriySalnikov; fork maintained by [cokluk](https://github.com/cokluk).
