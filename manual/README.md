ExtGCP -- an external interface for Gaussian to use Grimme's gCP.
=================

Warnings:
-----------------
    1. This is only a test version, and the author provides NO WARRANT.
       Please report bugs to snljty@sina.com.

    2. Handle with your Gaussian CopyRight yourself.

    3. Before using, make sure your Gaussian and gCP are properly installed.

    4. Can only run under Linux due to Gaussian invoking mechanism
       and programming reasons.

    5. Only works for Gaussian 09 or Gaussian 16.

    6. As the limit of individual gCP program and the format of Gaussian
       output file, only Hartree-Fock and common DFT functionals can
       be used. No double-hybrid functionals or post-HF. 
       And the basis sets available are limited. Use gcp -h to see details.

    7. Any method needs Hessian Matrix is currently UNAVAILABLE. May be added
       in the next version, but do have any expectation on it.

    8. In current version, it will cause the data of dipole-moment derivative
       and polarization entirely USELESS, and the dipole-moment is under level
       WITHOUT gCP.

    9. the chk file of this task will NOT contain wavefunction and other
       information, the useExtGau.chk file contains part of such information.


put these files !!! under your working directory !!!:
-----------------
    0. This script
        ExtGCP.sh

    1. Gaussian input file
        No level should appear in this file. test.gjf is an example.
        The things you need to change are your task type, 
        e.g. SP, Opt, Opt=(TS,CalcFC), 
        as well as your atom name and coordinates.
        You may change the memory setting in this file, 
        but remember, the memory used by this file
        plus the memory used by real calculation invoked 
        automatically cannot be larger than your physical memory.
        Can only run under serial mode, the energy and derivates 
        can be calculated paralleled otherwhere.
        !!!!!! External="./ExtGCP.sh" must appear in any task.
        !!!!!! Opt=NoMicro must appear in a geometry optimize task.

    2. ExtGCP_settings.ini
        contains settings needed.
        See the comments inside clearly to know what you need to do.

    3. Binaries
        ReadExtOut GeneExtInp


How to compile:
-----------------
    Binary files are already provided, which are ReadExtOut and GeneExtInp.
    The shell script ExtGCP.sh and pure text file ExtGCP_settings.ini 
    are also needed, and are also provided.
    However, if you would like to compile all binary files yourself, 
    all source files can be found inside src.tar.gz.
    In this case, What you need to do is extract this tar package, 
    check Makefile, and simplily type `make`. Then copy ExtGCP.sh, 
    ExtGCP_settings.ini, ReadExtOut and GeneExtInp to your working directory.


Enjoy using.
-----------------



*****************

ExtGCP -- 一个Gaussian调用Grimme的gCP的接口
=================

警告：
-----------------
    1. 本程序仅为测试版本，不对计算结果负任何责任（虽然经过测试）。请谨慎使用。
       如果发现bug，请发到 snljty@sina.com.

    2. 请自行处理Gaussian的版权问题。

    3. 使用前请确定自己的Gaussian和gCP安装正确。

    4. 由于Gaussian调用的机制限制（主要原因），以及编程的方便，只有Linux版本。

    5. 只能用于Gaussian 09或者Gaussian 16。之前版本没有External接口。

    6. 由于独立的gCP程序支持的水平很有限，以及Gaussian输出文件格式的限制，只能用
       Hartree-Fock方法和一些DFT方法。不支持双杂化泛函以及后HF。而且可用的基组
       比较有限，请参见gCP的帮助（使用gcp -h）。

    7. 目前版本不支持任何需要能量对坐标二阶导数，即Hessian矩阵的方法
       （尽管在写，gcp的-hess选项不知道为什么无效）。
       也许在未来版本会加入，但是不要抱任何希望。

    8. 目前会导致Gaussian输出的偶极矩导数和极化率完全没法用，偶极矩是没加gCP级别的。

    9. 这个任务的chk文件不含有波函数等信息，部分信息在useExtGau.chk里。


将下面这些文件放入你的!!!工作目录!!!，包含你的输入文件的目录下：
-----------------
    0. 这个脚本
        ExtGCP.sh，注意可执行权限

    1. Gaussian输入文件
        这里面不应该填写计算级别，只应该填写任务类型，比如SP（单点能），
        Opt（几何优化），Opt=(TS,CalcFC)（找过渡态，目前版本用不了）。
        你也可以设置使用多少内存，但是切记，由于还要调用一个Gaussian计算
        能量、受力、力常数等，所以加一起的内存必须不超过物理内存限制。
        只能串行运行，请一定要加上%NProcShared=1之类的设置单核跑。这个任务本身
        通常计算量不大，计算量大的是计算单点能、受力、力常数等的部分，那些
        才可以并行。
        ！！！！！！External="ExtGCP.sh" 必须出现在任何任务中。
        ！！！！！！Opt=NoMicro必须出现在几何优化任务中。本程序不做
        这项检查，但是如果没有NoMicro选项，结果一定是用不了的。

    2. ExtGCP_settings.ini
        这是配置文件，使用之前一定！要修改里面的内容，请不要改乱，里面注释写着要怎么改。
        不要有非ASCII码字符路径等属于常识。里面空行之类的都不要乱动，尽管已经尽量考虑了
        兼容性。

    3. 各种二进制文件
        ReadExtOut GeneExtInp，注意可执行权限


如何编译:
-----------------
    文件包里已经提供了二进制文件ReadExtOut和GeneExtInp。
    shell脚本ExtGCP.sh和纯文本文件ExtGCP_settings.ini也是需要的，都一并提供了。
    然而，如果你想自己编译上面两个二进制文件，所有源代码文件都打包在src.tar.gz中了。
    你只需要解压，进入这个目录，检查一下Makefile文件，然后输入`make`即可。
    然后 把ReadExtOut，GeneExtInp，ExtGCP.sh以及ExtGCP_settings.ini
    放入你的工作目录即可。


请享受使用。
-----------------

