import os
import shutil
import subprocess

SCOOP_REMOTE_COMMAND = "Set-ExecutionPolicy RemoteSigned -Scope CurrentUser"
SCOOP_INSTALL_COMMAND = "irm get.scoop.sh | iex"
NVIM_INSTALL_COMMAND = "scoop install main/neovim"
NVIM_LOCAL_CONFIG_PATH = "./nvim"
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
    backup_path = os.path.join(TARGET_PATH, "old")
    backup_exist = os.path.exists(backup_path)
    nvim_old_config_path = os.path.join(TARGET_PATH, "nvim")
    nvim_old_config_path_exist = os.path.exists(nvim_old_config_path)

    if not nvim_old_config_path_exist:
        return

    if not backup_exist:
        os.mkdir(backup_path)

    shutil.move(nvim_old_config_path, backup_path)


def copy_nvim_config() -> None:
    nvim_config_path = os.path.join(TARGET_PATH, "nvim")

    shutil.copytree(NVIM_LOCAL_CONFIG_PATH, nvim_config_path, dirs_exist_ok=True)


if __name__ == "__main__":
    scoop_is_installed = check_if_scoop_is_installed()

    if not scoop_is_installed:
        install_scoop()

    install_nvim()
    create_backup()
    copy_nvim_config()
