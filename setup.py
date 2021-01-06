import setuptools

setuptools.setup(
    name="myproj",
    version="0.1",
    package_dir={"": "src"},
    packages=setuptools.find_packages("src"),
)
