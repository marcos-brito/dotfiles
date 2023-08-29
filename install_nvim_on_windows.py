import os
import shutil
import subprocess

SCOOP_REMOTE_COMMAND = "Set-ExecutionPolicy RemoteSigned -Scope CurrentUser"
SCOOP_INSTALL_COMMAND = "irm get.scoop.sh | iex"
NVIM_INSTALL_COMMAND = "scoop install main/neovim"
NVIM_CONFIG_PATH = "./nvim"
USER_PROFILE = os.environ["USERPROFILE"]
TARGET_PATH = os.path.join(USER_PROFILE, "AppData", "local")


def check_if_scoop_is_installed() -> bool:
    if shutil.which("scoop") != None:
        return True

    return False


def install_scoop() -> None:
    subprocess.run(["powershell.exe", "-Command", SCOOP_REMOTE_COMMAND])
    subprocess.run(["powershell.exe", "-Command", SCOOP_INSTALL_COMMAND])


def install_nvim() -> None:
    subprocess.run(["powershell.exe", "-Command", NVIM_INSTALL_COMMAND])


def create_backup() -> None:
    BACKUP_PATH = os.path.join(TARGET_PATH, "old")
    BACKUP_EXIST = os.path.exists(BACKUP_PATH)
    NVIM_OLD_CONFIG_PATH = os.path.join(TARGET_PATH, "nvim")

    if not BACKUP_EXIST:
        os.mkdir(BACKUP_PATH)

    shutil.move(NVIM_OLD_CONFIG_PATH, BACKUP_PATH)


def copy_nvim_config() -> None:
    shutil.copytree(NVIM_CONFIG_PATH, TARGET_PATH)


if __name__ == "__main__":
    SCOOP_IS_INSTALLED = check_if_scoop_is_installed()

    if not SCOOP_IS_INSTALLED:
        install_scoop()

    install_nvim()
    create_backup()
    copy_nvim_config()
