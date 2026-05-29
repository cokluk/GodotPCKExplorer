# Godot PCK Explorer — Pre-built Releases

**Maintainer:** [@cokluk](https://github.com/cokluk) · **[Download releases](https://github.com/cokluk/GodotPCKExplorer/releases/latest)**

[![Releases](https://img.shields.io/github/v/release/cokluk/GodotPCKExplorer?label=download)](https://github.com/cokluk/GodotPCKExplorer/releases/latest)

Pre-built binaries for **Godot PCK Explorer** and **PCK Bruteforcer** — including packages that are missing or awkward to obtain from the upstream release page.

Fork of [DmitriySalnikov/GodotPCKExplorer](https://github.com/DmitriySalnikov/GodotPCKExplorer) (original author and source). This repo focuses on **ready-to-download builds** and [GitHub Actions](https://github.com/cokluk/GodotPCKExplorer/actions) packaging.

## Download

**[→ Release page](https://github.com/cokluk/GodotPCKExplorer/releases/latest)** · base URL for direct links: `https://github.com/cokluk/GodotPCKExplorer/releases/download/1.6.0/`

### Godot PCK Explorer (v1.6.0)

| Download | Description |
|----------|-------------|
| [GodotPCKExplorer_1.6.0_dotnet-ui-win.zip](https://github.com/cokluk/GodotPCKExplorer/releases/download/1.6.0/GodotPCKExplorer_1.6.0_dotnet-ui-win.zip) | Windows UI (.NET 9 Desktop Runtime) |
| [GodotPCKExplorer_1.6.0_dotnet-console-win-linux-mac.zip](https://github.com/cokluk/GodotPCKExplorer/releases/download/1.6.0/GodotPCKExplorer_1.6.0_dotnet-console-win-linux-mac.zip) | Console (`dotnet` on Win / Linux / macOS) |
| [GodotPCKExplorer_1.6.0_native-console-win-x64.zip](https://github.com/cokluk/GodotPCKExplorer/releases/download/1.6.0/GodotPCKExplorer_1.6.0_native-console-win-x64.zip) | Standalone, 64-bit Windows |
| [GodotPCKExplorer_1.6.0_native-console-win-x86.zip](https://github.com/cokluk/GodotPCKExplorer/releases/download/1.6.0/GodotPCKExplorer_1.6.0_native-console-win-x86.zip) | Standalone, 32-bit Windows |
| [GodotPCKExplorer_1.6.0_native-console-linux-x64.zip](https://github.com/cokluk/GodotPCKExplorer/releases/download/1.6.0/GodotPCKExplorer_1.6.0_native-console-linux-x64.zip) | Standalone, Linux x64 |
| [GodotPCKExplorer_1.6.0_native-console-mac-x64.zip](https://github.com/cokluk/GodotPCKExplorer/releases/download/1.6.0/GodotPCKExplorer_1.6.0_native-console-mac-x64.zip) | Standalone, macOS Intel |
| [GodotPCKExplorer_1.6.0_native-console-mac-arm64.zip](https://github.com/cokluk/GodotPCKExplorer/releases/download/1.6.0/GodotPCKExplorer_1.6.0_native-console-mac-arm64.zip) | Standalone, macOS Apple Silicon |

### PCK Bruteforcer (v1.0.3)

Godot 4 PCK encryption key recovery. Details: [Bruteforcer/README.md](Bruteforcer/README.md).

| Download | Description |
|----------|-------------|
| [PCKBruteforcer_1.0.3_dotnet-ui-win.zip](https://github.com/cokluk/GodotPCKExplorer/releases/download/1.6.0/PCKBruteforcer_1.0.3_dotnet-ui-win.zip) | Windows UI (.NET 9 Desktop Runtime) |
| [PCKBruteforcer_1.0.3_dotnet-console-win-linux-mac.zip](https://github.com/cokluk/GodotPCKExplorer/releases/download/1.6.0/PCKBruteforcer_1.0.3_dotnet-console-win-linux-mac.zip) | Console (`dotnet` on Win / Linux / macOS) |
| [PCKBruteforcer_1.0.3_native-console-win-x64.zip](https://github.com/cokluk/GodotPCKExplorer/releases/download/1.6.0/PCKBruteforcer_1.0.3_native-console-win-x64.zip) | Standalone, 64-bit Windows |
| [PCKBruteforcer_1.0.3_native-console-win-x86.zip](https://github.com/cokluk/GodotPCKExplorer/releases/download/1.6.0/PCKBruteforcer_1.0.3_native-console-win-x86.zip) | Standalone, 32-bit Windows |
| [PCKBruteforcer_1.0.3_native-console-linux-x64.zip](https://github.com/cokluk/GodotPCKExplorer/releases/download/1.6.0/PCKBruteforcer_1.0.3_native-console-linux-x64.zip) | Standalone, Linux x64 |
| [PCKBruteforcer_1.0.3_native-console-mac-x64.zip](https://github.com/cokluk/GodotPCKExplorer/releases/download/1.6.0/PCKBruteforcer_1.0.3_native-console-mac-x64.zip) | Standalone, macOS Intel |
| [PCKBruteforcer_1.0.3_native-console-mac-arm64.zip](https://github.com/cokluk/GodotPCKExplorer/releases/download/1.6.0/PCKBruteforcer_1.0.3_native-console-mac-arm64.zip) | Standalone, macOS Apple Silicon |

> [!NOTE]
> Links use release tag **`1.6.0`**. When publishing, create the GitHub release with that exact tag (not `v1.6.0`) so URLs stay valid. All 14 zip files belong on the same release.

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
- Create release tag **`1.6.0`** and push (matches download links in this README):

```bash
git tag 1.6.0
git push origin 1.6.0
```

## Upstream

Feature documentation and screenshots: [upstream README](https://github.com/DmitriySalnikov/GodotPCKExplorer/blob/master/README.md) · [upstream releases](https://github.com/DmitriySalnikov/GodotPCKExplorer/releases/latest) · [issues](https://github.com/DmitriySalnikov/GodotPCKExplorer/issues) for core app bugs.

## License

MIT. See [LICENSE](LICENSE). Original copyright DmitriySalnikov; fork maintained by [cokluk](https://github.com/cokluk).
