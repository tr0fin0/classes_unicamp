class CPU():
    def __init__(self) -> None:
        self.CPI = 2
        self.N_INSTRUCTIONS = 1000  # Arbitrary
        self.PERCENT_MEM_INST = 10/100
        self.N_MEM_INST = self.N_INSTRUCTIONS * self.PERCENT_MEM_INST
        self.base_cycles = self.CPI * self.N_INSTRUCTIONS

        self.L1_I_COST = None
        self.L1_I_MISS_COST = None
        self.L1_I_MISS_RATE = None

        self.L1_D_COST = None
        self.L1_D_MISS_COST = None
        self.L1_D_MISS_RATE = None

        self.L2_COST = None
        self.L2_MISS_COST = None
        self.L2_MISS_RATE = None

        self.L3_COST = None
        self.L3_MISS_COST = None
        self.L3_MISS_RATE = None

    def set_L1_I(self, cost, miss_cost, miss_rate):
        self.L1_I_COST = cost
        self.L1_I_MISS_COST = miss_cost
        self.L1_I_MISS_RATE = miss_rate

    def set_L1_D(self, cost, miss_cost, miss_rate):
        self.L1_D_COST = cost
        self.L1_D_MISS_COST = miss_cost
        self.L1_D_MISS_RATE = miss_rate

    def set_L2(self, cost, miss_cost, miss_rate):
        self.L2_COST = cost
        self.L2_MISS_COST = miss_cost
        self.L2_MISS_RATE = miss_rate

    def set_L3(self, cost, miss_cost, miss_rate):
        self.L3_COST = cost
        self.L3_MISS_COST = miss_cost
        self.L3_MISS_RATE = miss_rate

    def set_CPI(self, value):
        self.CPI = value
        self.base_cycles = self.CPI * self.N_INSTRUCTIONS

    def print_CPI(self):

        L1_I_MISSES = self.L1_I_MISS_RATE * self.N_INSTRUCTIONS
        L1_I_LATENCY = (self.N_INSTRUCTIONS * self.L1_I_COST +
                        L1_I_MISSES * self.L1_I_MISS_COST)

        L1_D_MISSES = self.L1_D_MISS_RATE * self.N_MEM_INST
        L1_D_LATENCY = (self.N_MEM_INST * self.L1_D_COST +
                        L1_D_MISSES * self.L1_D_MISS_COST)

        L2_ACCESS = L1_D_MISSES + L1_I_MISSES
        L2_MISSES = L2_ACCESS * self.L2_MISS_RATE
        L2_LATENCY = (L2_ACCESS * self.L2_COST +
                      L2_MISSES*self.L2_MISS_COST)

        L3_ACCESS = L2_MISSES
        L3_MISSES = L3_ACCESS * self.L3_MISS_RATE
        L3_LATENCY = (L3_ACCESS * self.L3_COST +
                      L3_MISSES*self.L3_MISS_COST)

        TOTAL_CYCLES = (self.base_cycles +
                        L1_I_LATENCY +
                        L1_D_LATENCY +
                        L2_LATENCY +
                        L3_LATENCY)
        print(f"{TOTAL_CYCLES/self.N_INSTRUCTIONS = }")


def outros_valores() -> None:
    cpu = CPU()
    cpu.set_CPI(1)
    cpu.set_L1_I(0, 15, 5/100)
    cpu.set_L1_D(0, 0, 0)
    cpu.set_L2(0, 0, 0)
    cpu.set_L3(0, 0, 0)
    cpu.print_CPI()

    cpu.set_L1_D(0, 15, 30/100)
    cpu.print_CPI()

    cpu.set_L2(0, 30, 10/100)
    cpu.print_CPI()

    cpu.set_L3(0, 150, 5/100)
    cpu.print_CPI()

def main() -> None:
    cpu = CPU()
    cpu.set_CPI(2)
    cpu.set_L1_I(0, 15, 10/100)
    cpu.set_L1_D(0, 0, 0)
    cpu.set_L2(0, 0, 0)
    cpu.set_L3(0, 0, 0)
    cpu.print_CPI()

    cpu.set_L1_D(0, 15, 10/100)
    cpu.print_CPI()

    cpu.set_L2(0, 30, 20/100)
    cpu.print_CPI()

    cpu.set_L3(0, 150, 10/100)
    cpu.print_CPI()


if __name__ == "__main__":
    main()
