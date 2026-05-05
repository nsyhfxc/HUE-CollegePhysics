# 大学物理 B 复习讲义

这是河北工程大学 2025-2026 学年第 2 学期《大学物理 B》课程复习资料的 LaTeX 源码仓库，内容以课堂笔记、公式整理、例题和图示为主。项目使用 `ctexbook` 排版中文讲义，主文件为 `main.tex`，当前已生成的 PDF 为 `main.pdf`。

## 内容概览

讲义目前包含以下部分：

- 力学：质点运动学、牛顿运动定律、功和能、动量、刚体的定轴转动、机械振动、机械波。
- 电磁学：真空中的静电场、电介质中的静电场、真空中的静磁场。
- 热学：气体动理论、理想气体状态方程、麦克斯韦速率分布、热力学第一定律、循环过程等。
- 光学：光的电磁理论、干涉、衍射、光栅衍射、偏振等。
- 近代物理：狭义相对论、波粒二象性、光电效应、康普顿效应、氢原子模型、量子理论基础等。
- 附录：希腊字母等补充内容。

## 项目结构

```text
.
├── main.tex              # 讲义入口文件，负责组织全书结构
├── config.sty            # 通用宏包、页面样式、数学命令和自定义环境
├── main.pdf              # 当前编译得到的讲义 PDF
├── chapter/
│   ├── index.tex         # 扉页或导言内容
│   ├── Chapter01.tex     # 第 1 章入口
│   ├── Chapter01A.tex    # 第 1 章分节内容
│   ├── Chapter01B.tex
│   ├── ...
│   ├── Chapter10F.tex
│   ├── Chapter11.tex     # 热学部分入口
│   ├── ...
│   ├── Chapter16B.tex
│   ├── ReferenceOld.tex  # 迁移自 old 的参考文献
│   └── AppendixGreek.tex # 附录
├── old/                  # 旧版热学、光学、近代物理源码归档，保留不改
└── .gitignore            # LaTeX 辅助文件和编辑器文件忽略规则
```

章节文件采用分层组织：

- `ChapterXX.tex`：对应每章的入口文件，通常包含章标题、导语和若干 `\input`。
- `ChapterXXA.tex`、`ChapterXXB.tex` 等：对应章节下的具体内容。
- `ChapterXX*_Figure*.tex`：由 TikZ、CircuitikZ 等维护的图形源码片段。
- `Chapter13A_Image01.png`：光学部分使用的外部图片资源。

当前章节编号大致对应：

- `Chapter01`--`Chapter07`：力学
- `Chapter08`--`Chapter10`：电磁学
- `Chapter11`--`Chapter12`：热学
- `Chapter13`：光学
- `Chapter14`--`Chapter16`：近代物理

## 编译环境

推荐使用支持中文排版的 LaTeX 发行版：

- MiKTeX 或 TeX Live
- XeLaTeX
- 常用宏包：`ctex`、`amsmath`、`physics`、`siunitx`、`tikz`、`circuitikz`、`tcolorbox`、`hyperref` 等

源码以 UTF-8 编码保存，建议使用支持 UTF-8 的编辑器打开。

## 编译方法

在项目根目录运行：

```powershell
xelatex -interaction=nonstopmode -halt-on-error main.tex
xelatex -interaction=nonstopmode -halt-on-error main.tex
```

需要自动处理多次编译时，也可以使用：

```powershell
latexmk -xelatex main.tex
```

编译完成后会生成或更新 `main.pdf`。若目录、引用或书签未完全更新，重复运行一次 XeLaTeX 即可。

当前仓库已在 Windows + MiKTeX 环境下使用 XeLaTeX 完整编译通过，生成的 `main.pdf` 为 411 页。

## 旧稿迁移说明

`old/` 目录中的热学、光学和近代物理内容已经迁移到 `chapter/` 下的新章节文件中，旧目录作为原始资料归档保留。迁移后的源码不再依赖旧稿中的零散样式文件，而是统一通过根目录的 `config.sty` 提供宏包、环境和兼容命令。

旧稿中的部分图形原来依赖外部生成的 PDF 或高密度 TikZ 采样。迁移后已改为项目内可直接编译的 TikZ 源码；其中光栅衍射仿真图做了降采样处理，以避免整书编译时耗尽 TeX 内存。`Chapter13E_Figure07a.tex` 和 `Chapter13E_Figure07b.tex` 是缺失原始图源的占位图。

目前 `main.log` 仍可能出现少量旧稿遗留的非阻断警告，包括未定义交叉引用、重复标签和个别 overfull/underfull box。这些警告不会阻止 `main.pdf` 生成。

## 写作和维护说明

新增章节时：

1. 在 `chapter/` 下新建对应的章节文件，例如 `Chapter11.tex`。
2. 在 `main.tex` 中合适的位置加入 `\input{chapter/Chapter11.tex}`。
3. 若章节较长，可继续拆分为 `Chapter11A.tex`、`Chapter11B.tex` 等文件，并在 `Chapter11.tex` 中引用。

新增图形时：

1. 优先将 TikZ 或 CircuitikZ 图形保存为独立的 `ChapterXX*_FigureYY.tex`。
2. 在正文中使用 `\inputfigure{ChapterXX*_FigureYY}` 引入。
3. 若外部图片缺失，`config.sty` 中已对 `\includegraphics` 做了兜底处理，会在 PDF 中显示缺失提示框。

## 清理辅助文件

LaTeX 编译会生成 `.aux`、`.log`、`.out`、`.toc`、`.synctex.gz` 等辅助文件，这些文件已在 `.gitignore` 中配置为忽略。

如需手动清理，可删除这些辅助文件，保留源码文件和必要的 `main.pdf` 即可。

## 许可

当前项目未声明开源许可证。如需公开发布、分发或协作维护，建议补充 `LICENSE` 文件并说明资料来源与使用范围。
