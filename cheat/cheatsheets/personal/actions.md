
How to get output from a step
    - name: Check Runner Status
      id: status
      uses: ./.github/actions/run-commands-on-ec2
      with:
        commands: >-
          "echo \"hi there from the ec2!\"",
          "cd /opt/actions-runner",
          "sudo ./svc.sh status"

    - name: Echo output 
          run: |
            echo "${{ steps.status.outputs.output }}"
