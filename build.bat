for /d %%b in (*) do (
    cd %b%
    conda build . --python "%PYTHON_VERSION%" --token "%ANACONDA_CLOUD_TOKEN%"
    cd ..
)
