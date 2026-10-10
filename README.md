![Logo of the Arch Bootc Builder or Compiler project](/assets/logowithtext.png)
# ABBoC (Arch Bootc Builder or Compiler)
Separate container image that compiles bootc and bootupd for Arch 

## How do I use this?
It's simple!
```docker
COPY --from=ghcr.io/distrolabs:abboc /pkgout /destination
```
You can then install the packages from the target system using
```docker
RUN pacman -U /destination/*.pkg.tar.zst
```

## What is this?
To reduce [ArctineOS](https://github.com/ArctineLabs/OS) building times (it currently takes around 20-24 minutes to build ArctineOS, with the compilation process for bootc, selinux and bootupd occupying the most amount of time), Arctine/Distrolabs came up wuth a solution to make this container image and build bootc once a week.

This allows for ArctineOS to simply take the already compiled packages from this image, and simply install it in the target system.

## «But 24 minutes don't seem long!»
A 20-24 minute build duration only allows for 2-3 builds to complete in an hour without any of them being interrupted.

This decreases productivity as multiple pushes occur, even in an hour.

This can also make troubleshooting difficult, as it'd require the maintainers to fully wait through the build process, commit & push, and wait through the entire process again.

## Fair... but how come it's called ***Arch*** Bootc Builder and not ArctineOS Bootc Builder?
This project *was* made with ArctineOS in mind, but the code and this image doesn't contain anything ArctineOS specific, and it may remain like this.

That way, other bootc projects based on Arch are also free to use ABBoC for their projects.

## That's cool...what is that logo though?
When making the logo, I had the intention of making it look bad, and like a cheap rip off of the [Asea Brown Boveri (ABB) logo](https://de.wikipedia.org/wiki/ABB_(Unternehmen)).

## Where did you get your code though?
Most, if not all, has been taken from [ArctineOS](https://github.com/ArctineLabs/OS). The logos have been designed by me.