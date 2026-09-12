import importlib.util
from pathlib import Path
import unittest

import numpy as np

SCRIPT = Path(__file__).parents[1] / "plot_polix_crab_l2.py"
SPEC = importlib.util.spec_from_file_location("polix_quicklook", SCRIPT)
MODULE = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(MODULE)


class FitTwofoldTest(unittest.TestCase):
    def test_recovers_known_fraction(self):
        phi = np.arange(360.0)
        error = np.ones_like(phi)
        rate = 100 + 8 * np.cos(2 * np.deg2rad(phi)) + 6 * np.sin(2 * np.deg2rad(phi))
        model, fraction, _, chi2, dof = MODULE.fit_twofold(phi, rate, error)
        self.assertAlmostEqual(fraction, 0.1)
        self.assertAlmostEqual(chi2, 0.0)
        self.assertEqual(dof, 357)
        np.testing.assert_allclose(model, rate)


if __name__ == "__main__":
    unittest.main()
